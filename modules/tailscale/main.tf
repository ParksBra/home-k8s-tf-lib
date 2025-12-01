resource "helm_release" "application" {
  depends_on = [
    data.kubernetes_namespace.namespace,
    kubernetes_secret.oauth,
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
      name  = "oauth.clientId"
      value = ""
    },
    {
      name = "oauth.clientSecret"
      value = "" # We want to leave these blank as we create the secret via terraform
    },
    {
      name  = "operatorConfig.defaultTags"
      value = join(",", var.operator_default_tags)
    },
    {
      name  = "operatorConfig.image.repository"
      value = var.operator_image_repository
    },
    {
      name  = "operatorConfig.image.tag"
      value = var.operator_image_tag
    },
    {
      name  = "operatorConfig.image.pullPolicy"
      value = var.operator_image_pull_policy
    },
    {
      name  = "proxyConfig.defaultTags"
      value = join(",", var.proxy_default_tags)
    },
    {
      name  = "proxyConfig.image.repository"
      value = var.proxy_image_repository
    },
    {
      name  = "proxyConfig.image.tag"
      value = var.proxy_image_tag
    },
    {
      name  = "proxyConfig.image.pullPolicy"
      value = var.proxy_image_pull_policy
    },
    {
      name  = "ingressClass.name"
      value = var.ingress_class_name
    }
  ]
}
