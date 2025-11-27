locals {
  creation_wait_check_interval = "30s"
}

# We want to wait for auto-discovery to have a chance to create the Akri instances
resource "wait_for" "akri_resources_creation" {
  count = var.enable_creation_wait ? 1 : 0

  depends_on = [
    helm_release.application
  ]

  triggers = {
    akri_udev_instance_creation = helm_release.application
  }

  create_duration = local.creation_wait_check_interval
}
