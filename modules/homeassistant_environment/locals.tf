locals {
  kubeconfig_path = "~/.kube/config"
  environment_namespace = var.namespace
  environment_ingress_class_name = "nginx"
  environment_ingress_annotations = {
    "cert-manager.io/cluster-issuer" = module.cert_manager.cluster_issuer_name
  }

  parent_domain = var.parent_domain
  homeassistant_subdomain = "home.${local.parent_domain}"
  homeassistant_codeserver_subdomain = "code.${local.homeassistant_subdomain}"
  zigbee2mqtt_subdomain = "z2m.${local.parent_domain}"

  zfs_pool_name = "zfspv-pool"
  homeassistant_storage_size = "32Gi"
  mosquitto_storage_size = "8Gi"
  zigbee2mqtt_storage_size = "8Gi"

  acme_email = var.acme_email
  cloudflare_email = var.cloudflare_email
}
