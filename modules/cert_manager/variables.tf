variable "namespace" {
  description = "The Kubernetes namespace to deploy the cert-manager into."
  type        = string
  default     = "cert-manager"
}

variable "create_namespace" {
  description = "Whether to create the namespace for cert-manager."
  type        = bool
  default     = true
}

variable "create_cluster_issuer" {
  description = "Whether to create a ClusterIssuer resource."
  type        = bool
  default     = true
}

variable "cluster_issuer_name" {
  description = "The name of the ClusterIssuer resource to create."
  type        = string
  default     = "letsencrypt"
}

variable "acme_email" {
  description = "The email address to use for ACME registration."
  type        = string
}

variable "dns_solver_email" {
  description = "The email address associated with the DNS provider account."
  type        = string
}

variable "dns_solver_api_token" {
  description = "The API token associated with the DNS provider account."
  type        = string
  sensitive   = true
}

variable "dns_solver_provider" {
  description = "The DNS provider to use for DNS01 challenge solving."
  type        = string
  default     = "cloudflare"
}
