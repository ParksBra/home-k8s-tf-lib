locals {
  repository = "https://storage.googleapis.com/t3n-helm-charts"
  chart_reference = "mosquitto"

  chart_install_name = var.chart_install_name != null ? var.chart_install_name : local.chart_reference

  namespace = var.namespace != null ? var.namespace : local.chart_install_name

  persistence_path = "/mosquitto/data/"
  password_file_path = "/etc/mosquitto/passwordfile"
}

locals {
  # Jinja Template Data Sources
  configuration_template_path = "${path.module}/templates/configuration.j2"
  jinja_context = jsonencode({
    data_persistence_enabled = var.data_persistence_enabled
    persistence_path         = local.persistence_path
    password_file_path       = local.password_file_path
    mqtt_port                = var.mqtt_port
    websocket_port           = var.websocket_port
  })
}
