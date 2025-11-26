locals {
  mosquitto_mqtt_broker_address = "mqtt://${module.mosquitto.service_address}:${module.mosquitto.service_mqtt_port}"
}

module "zigbee2mqtt" {
  source = "../zigbee2mqtt"
  depends_on = [
    kubernetes_namespace.namespace,
    module.akri,
    data.kubernetes_resources.akri_udev_instances,
    module.mosquitto,
    module.storageclass,
    module.cert_manager
  ]

  namespace                = kubernetes_namespace.namespace.id

  mqtt_broker_address      = local.mosquitto_mqtt_broker_address
  mqtt_broker_username     = module.mosquitto.admin_username
  mqtt_broker_password     = module.mosquitto.admin_password

  data_persistence_enabled = var.enable_persistent_storage
  data_volume_size_gb      = local.zigbee2mqtt_storage_size_gb
  data_storage_class_name  = var.enable_persistent_storage ? module.storageclass[0].id : ""

  ingress_enabled          = true
  ingress_class_name       = local.environment_ingress_class_name
  ingress_host_address     = local.zigbee2mqtt_subdomain
  ingress_annotations      = local.environment_ingress_annotations

  pod_additional_resources = length(data.kubernetes_resources.akri_udev_instances.objects) > 0 ? {
    "${data.kubernetes_resources.akri_udev_instances.objects[0].spec.cdiName}" = "1"
  } : {}

  zigbee_serial_port       = length(data.kubernetes_resources.akri_udev_instances.objects) > 0 ? data.kubernetes_resources.akri_udev_instances.objects[0].spec.brokerProperties.UDEV_DEVNODE_0 : null
}
