locals {
  repository = "https://docs.tigera.io/calico/charts"
  chart_reference = "tigera-operator"

  chart_install_name = var.chart_install_name != null ? var.chart_install_name : local.chart_reference

  namespace = var.namespace != null ? var.namespace : local.chart_install_name

  ip_pool_name = "pod-netowork-ipv4"
}
