output "namespace" {
  description = "The name of the namespace in which Kubernetes Dashboard is deployed."
  value       = data.kubernetes_namespace.namespace.metadata[0].name
}

output "chart_id" {
  description = "The Helm release ID for Home Assistant."
  value       = helm_release.application.id
}

output "chart_name" {
  description = "The Helm chart reference for Home Assistant."
  value       = helm_release.application.name
}

output "chart_reference" {
  description = "The Helm chart reference for Kubernetes Dashboard."
  value       = local.chart_reference
}

output "service_address" {
  description = "The address of the Kubernetes Dashboard service."
  value       = "${helm_release.application.name}.${data.kubernetes_namespace.namespace.metadata[0].name}.svc"
}

output "ingress_enabled" {
  description = "Whether ingress is enabled for the Home Assistant service."
  value       = var.ingress_enabled
}

output "ingress_address" {
  description = "The ingress address of the Home Assistant service."
  value       = var.ingress_enabled ? var.ingress_host_address : ""
}
