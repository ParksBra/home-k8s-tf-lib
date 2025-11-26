module "mosquitto" {
  source = "../mosquitto"
  depends_on = [
    module.storageclass
  ]

  kubeconfig_path = local.kubeconfig_path

  namespace                       = kubernetes_namespace.namespace.id

  data_persistence_enabled        = true
  data_volume_size                = local.mosquitto_storage_size
  data_storage_class_name         = module.storageclass.id

  admin_username                  = var.mosquitto_admin_username
  admin_password                  = var.mosquitto_admin_password

  service_external_traffic_policy = ""
}
