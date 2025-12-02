resource "kubernetes_secret" "oauth" {
  depends_on = [
    data.kubernetes_namespace.namespace
  ]
  metadata {
    name = local.oauth_secret_name
    namespace = data.kubernetes_namespace.namespace.metadata[0].name
  }
  data = {
    client_id = var.oauth_client_id
    client_secret = var.oauth_client_secret
  }
  type = "Opaque"
}
