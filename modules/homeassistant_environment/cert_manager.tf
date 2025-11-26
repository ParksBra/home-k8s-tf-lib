locals {
  cloudflare_secret_key = "api-token"
}

resource "kubernetes_secret" "cloudflare_api_token" {
  metadata {
    name      = "cloudflare-api-token-secret"
    namespace = local.environment_namespace
  }
  data = {
    "${local.cloudflare_secret_key}" = var.cloudflare_api_token
  }
  type = "Opaque"
}

module "cert_manager" {
  source = "terraform-iaac/cert-manager/kubernetes"
  depends_on = [
    kubernetes_secret.cloudflare_api_token
  ]
  namespace_name = local.environment_namespace
  cluster_issuer_email = local.acme_email
  cluster_issuer_create = true
  solvers = [
    {
      dns01 = {
        cloudflare = {
          email = local.cloudflare_email
          apiTokenSecretRef = {
            name = kubernetes_secret.cloudflare_api_token.id
            key  = local.cloudflare_secret_key
          }
        }
      }
    }
  ]
}
