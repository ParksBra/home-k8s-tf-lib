resource "helm_release" "application" {
  depends_on = [
    data.kubernetes_namespace.namespace,
  ]

  name       = local.chart_install_name
  repository = local.repository
  chart      = local.chart_reference
  version    = var.chart_version

  namespace        = data.kubernetes_namespace.namespace.metadata[0].name
  create_namespace = false

  dependency_update = var.chart_dependency_update
  lint              = var.chart_linting_enabled
  recreate_pods     = var.chart_recreate_pods
  upgrade_install   = var.chart_upgrade_install
  replace           = var.chart_replace
  cleanup_on_fail   = var.chart_cleanup_on_fail

  set = [
    {
      name  = "controller.service.type"
      value = var.service_type
    },
    {
      name  = "controller.service.loadBalancerClass"
      value = var.service_load_balancer_class
    },
    {
      name  = "controller.service.ports.http"
      value = tostring(var.service_http_port)
    },
    {
      name  = "controller.service.targetPorts.http"
      value = "http"
    },
    {
      name  = "controller.service.ports.https"
      value = tostring(var.service_https_port)
    },
    {
      name  = "controller.service.targetPorts.https"
      value = "https"
    }
  ]
}
