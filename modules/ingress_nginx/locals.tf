locals {
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart_reference = "ingress-nginx"

  chart_install_name = var.chart_install_name != null ? var.chart_install_name : local.chart_reference

  namespace = var.namespace != null ? var.namespace : local.chart_install_name

  creation_wait_check_duration = "${var.creation_wait_seconds}s"

  controller_name = "controller"
  controller_full_name = "${local.chart_install_name}-${local.controller_name}"

  loadbalancer_ip = var.service_type == "LoadBalancer" ? data.kubernetes_service.controller.status[0].load_balancer[0].ingress[0].ip : null
}

data "kubernetes_service" "controller" {
  depends_on = [
    helm_release.application,
    time_sleep.resources_creation
  ]

  metadata {
    name      = local.controller_full_name
    namespace = data.kubernetes_namespace.namespace.metadata[0].name
  }
}
