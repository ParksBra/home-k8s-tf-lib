output "namespace_id" {
  description = "The namespace ID where the MinIO operator is deployed."
  value       = data.kubernetes_namespace.namespace.id
}

output "namespace_name" {
  description = "The name of the namespace in which the MinIO operator is deployed."
  value       = data.kubernetes_namespace.namespace.metadata[0].name
}

output "chart_id" {
  description = "The Helm release ID for the MinIO operator."
  value       = helm_release.application.id
}

output "chart_name" {
  description = "The Helm chart reference for the MinIO operator."
  value       = helm_release.application.name
}

output "chart_reference" {
  description = "The Helm chart reference for the MinIO operator."
  value       = local.chart_reference
}
