locals {
  repository = "https://pkgs.tailscale.com/helmcharts"
  chart_reference = "tailscale-operator"

  chart_install_name = var.chart_install_name != null ? var.chart_install_name : local.chart_reference

  namespace = var.namespace != null ? var.namespace : local.chart_install_name

  oauth_secret_name = "operator-oauth" # Hardcoded in helm chart
}
