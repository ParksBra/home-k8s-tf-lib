module "homeassistant" {
  source = "../homeassistant"
  depends_on = [
    module.storageclass,
    module.cert_manager
  ]

  namespace                        = kubernetes_namespace.namespace.id

  ingress_enabled                  = true
  ingress_class_name               = local.environment_ingress_class_name
  ingress_host_address             = local.homeassistant_subdomain
  ingress_annotations              = local.environment_ingress_annotations

  pod_host_network_enabled         = true
  pod_dns_policy                   = "ClusterFirstWithHostNet"

  data_storage_persistence_enabled = var.enable_persistent_storage
  data_volume_size                 = local.homeassistant_storage_size
  data_storage_class_name          = var.enable_persistent_storage ? module.storageclass[0].id : ""

  codeserver_enabled               = true
  codeserver_auth_enabled          = true
  codeserver_ingress_enabled       = true
  codeserver_ingress_host_address  = local.homeassistant_codeserver_subdomain
  codeserver_ingress_class_name    = local.environment_ingress_class_name
  codeserver_ingress_annotations   = local.environment_ingress_annotations
}
