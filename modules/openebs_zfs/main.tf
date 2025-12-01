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
      name  = "engines.local.zfs.enabled"
      value = "true"
    },
    {
      name  = "engines.local.lvm.enabled"
      value = "false"
    },
    {
      name  = "engines.loki-stack.enabled"
      value = "false"
    },
    {
      name  = "engines.replicated.mayastor.enabled"
      value = "false"
    },
    {
      name  = "zfs-localpv.zfsNode.kubeletDir"
      value = var.kubelet_dir
    }
  ]
}
