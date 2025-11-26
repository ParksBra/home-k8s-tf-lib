module "storageclass" {
  source = "../zfs_storageclass"

  kubeconfig_path = local.kubeconfig_path
  name = "${kubernetes_namespace.namespace.id}-sc"
  zfs_pool_name = local.zfs_pool_name
  reclaim_policy = "Retain"
}
