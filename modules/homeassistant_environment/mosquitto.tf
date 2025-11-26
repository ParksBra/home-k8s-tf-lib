module "mosquitto" {
  source = "../mosquitto"
  depends_on = [
    kubernetes_namespace.namespace,
    module.storageclass
  ]

  python_executable               = var.python_executable

  namespace                       = kubernetes_namespace.namespace.id

  data_persistence_enabled        = var.enable_persistent_storage
  data_volume_size_gb             = local.mosquitto_storage_size_gb
  data_storage_class_name         = var.enable_persistent_storage ? module.storageclass[0].id : ""

  admin_username                  = var.mosquitto_admin_username
  admin_password                  = var.mosquitto_admin_password

  service_external_traffic_policy = "" # Empty string as defualt "CLuster" causes issues
}
