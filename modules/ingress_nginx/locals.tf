locals {
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart_reference = "ingress-nginx"

  chart_install_name = var.chart_install_name != null ? var.chart_install_name : local.chart_reference

  namespace = var.namespace != null ? var.namespace : local.chart_install_name
}
