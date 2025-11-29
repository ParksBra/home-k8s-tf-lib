output "namespace" {
  description = "The Kubernetes namespace where cert-manager is deployed."
  value       = data.kubernetes_namespace.namespace.metadata[0].name
}

output "namespace_id" {
  description = "The ID of the Kubernetes namespace where cert-manager is deployed."
  value       = data.kubernetes_namespace.namespace.id
}

output "cluster_issuer_name" {
  description = "The name of the ClusterIssuer resource."
  value       = module.cert_manager.cluster_issuer_name
}
