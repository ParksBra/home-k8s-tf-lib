resource "kubernetes_secret" "cloudflare_api_token" {
  depends_on = [
    kubernetes_namespace.namespace
  ]
  metadata {
    name      = "dns-solver-api-token-secret"
    namespace = kubernetes_namespace.namespace.metadata[0].name
  }
  data = {
    "${local.dns_solver_secret_key}" = var.dns_solver_api_token
  }
  type = "Opaque"
}
