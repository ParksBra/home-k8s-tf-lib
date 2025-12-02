# We want to wait for auto-discovery to have a chance to create the Akri instances
resource "time_sleep" "resources_creation" {
  count = var.enable_creation_wait ? 1 : 0

  depends_on = [
    helm_release.application
  ]

  triggers = {
    ip_pool_name = local.ip_pool_name
    pod_network_cidr = var.pod_network_cidr
  }

  create_duration = local.creation_wait_check_duration
}
