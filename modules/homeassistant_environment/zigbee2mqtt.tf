module "zigbee2mqtt" {
  source = "../zigbee2mqtt"
  depends_on = [
    module.mosquitto,
    module.storageclass,
    module.cert_manager
  ]

  namespace = kubernetes_namespace.namespace.id

  mqtt_broker_address = "mqtt://${module.mosquitto.service_fqdn}:${module.mosquitto.service_port}"
  mqtt_broker_username = module.mosquitto.admin_username
  mqtt_broker_password = module.mosquitto.admin_password

  data_persistence_enabled = var.enable_persistent_storage
  data_volume_size = local.zigbee2mqtt_storage_size
  data_storage_class_name = var.enable_persistent_storage ? module.storageclass[0].id : ""

  ingress_enabled = true
  ingress_class_name = local.environment_ingress_class_name
  ingress_host_address = local.zigbee2mqtt_subdomain
  ingress_annotations = local.environment_ingress_annotations

  zigbee_serial_port = "/dev/ttyUSB0"
}
