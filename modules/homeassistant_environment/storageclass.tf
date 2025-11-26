module "storageclass" {
  count = var.enable_persistent_storage ? 1 : 0
  source = "../zfs_storageclass"

  name = "${kubernetes_namespace.namespace.id}-sc"
  zfs_pool_name = local.zfs_pool_name
  reclaim_policy = local.storage_class_reclaim_policy
}
