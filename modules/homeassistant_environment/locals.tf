locals {
  environment_namespace = var.namespace
  environment_ingress_class_name = var.ingress_class_name
  # environment_ingress_annotations = {
  #   "cert-manager.io/cluster-issuer" = module.cert_manager.cluster_issuer_name
  # }
  environment_ingress_annotations = var.ingress_annotations
  parent_domain = var.parent_domain
  homeassistant_subdomain = "${var.homeassistant_subdomain}.${local.parent_domain}"
  homeassistant_codeserver_subdomain = "${var.homeassistant_codeserver_subdomain}.${local.homeassistant_subdomain}"
  zigbee2mqtt_subdomain = "${var.zigbee2mqtt_subdomain}.${local.parent_domain}"

  zfs_pool_name = var.zfs_pool_name
  storage_class_reclaim_policy = var.storage_class_reclaim_policy
  homeassistant_storage_size = var.homeassistant_storage_size
  mosquitto_storage_size = var.mosquitto_storage_size
  zigbee2mqtt_storage_size = var.zigbee2mqtt_storage_size

  acme_email = var.acme_email
  cloudflare_email = var.cloudflare_email
}
