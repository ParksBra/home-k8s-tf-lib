locals {
  repository = "https://kubernetes.github.io/dashboard"
  chart_reference = "kubernetes-dashboard"

  chart_install_name = var.chart_install_name != null ? var.chart_install_name : local.chart_reference

  namespace = var.namespace != null ? var.namespace : local.chart_install_name

  tls_secret_name = "${local.chart_install_name}-ingress-tls"
}
