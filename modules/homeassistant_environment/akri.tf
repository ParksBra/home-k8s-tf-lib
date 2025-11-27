module "akri" {
  source = "../akri"
  depends_on = [
    kubernetes_namespace.namespace,
  ]

  namespace                      = kubernetes_namespace.namespace.id

  udev_discovery_enabled         = true
  udev_instance_name             = "${kubernetes_namespace.namespace.id}-udev"
  udev_discovery_group_recursive = true
  udev_discovery_rules_list      = local.akri_udev_discovery_rules_list
}

data "kubernetes_resources" "akri_udev_instances" {
  depends_on = [
    module.akri
  ]
  api_version    = "akri.sh/v0"
  kind           = "Instance"
  namespace      = module.akri.namespace_id
  limit          = 1 # Hopefully in any future there will only be one instance and udev configuration. TODO: improve this if needed.
}
