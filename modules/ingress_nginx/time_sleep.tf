# We want to wait for auto-discovery to have a chance to create the Akri instances
resource "time_sleep" "resources_creation" {
  count = var.enable_creation_wait ? 1 : 0

  depends_on = [
    helm_release.application
  ]

  triggers = {
    service_load_balancer_class = var.service_load_balancer_class
    service_http_port           = var.service_http_port
    service_https_port          = var.service_https_port
    service_type                = var.service_type
  }

  create_duration = local.creation_wait_check_duration
}
