output "namespace_id" {
  description = "The namespace ID where the TailScale operator is deployed."
  value       = data.kubernetes_namespace.namespace.id
}

output "namespace_name" {
  description = "The name of the namespace in which the TailScale operator is deployed."
  value       = data.kubernetes_namespace.namespace.metadata[0].name
}

output "chart_id" {
  description = "The Helm release ID for the TailScale operator."
  value       = helm_release.application.id
}

output "chart_name" {
  description = "The Helm chart reference for the TailScale operator."
  value       = helm_release.application.name
}

output "ingress_class_name" {
  description = "The Ingress class name provided by the TailScale operator."
  value       = var.ingress_class_name
}
