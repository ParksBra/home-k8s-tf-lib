module "cert_manager" {
  source = "terraform-iaac/cert-manager/kubernetes"
  depends_on = [
    kubernetes_secret.dns_solver_api_token
  ]

  namespace_name        = data.kubernetes_namespace.namespace.metadata[0].name
  create_namespace      = false
  cluster_issuer_email  = var.acme_email
  cluster_issuer_create = var.create_cluster_issuer
  cluster_issuer_name   = var.cluster_issuer_name
  solvers               = [
    {
      dns01 = {
        "${var.dns_solver_provider}" = {
          email = var.dns_solver_email
          apiTokenSecretRef = {
            name = kubernetes_secret.dns_solver_api_token.metadata[0].name
            key  = local.dns_solver_secret_key
          }
        }
      }
    }
  ]
}
