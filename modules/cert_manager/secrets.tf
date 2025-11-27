resource "kubernetes_secret" "dns_solver_api_token" {
  depends_on = [
    data.kubernetes_namespace.namespace
  ]
  metadata {
    name      = "dns-solver-api-token-secret"
    namespace = data.kubernetes_namespace.namespace.metadata[0].name
  }
  data = {
    "${local.dns_solver_secret_key}" = var.dns_solver_api_token
  }
  type = "Opaque"
}
