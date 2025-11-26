output "namespace" {
  description = "The namespace ID where Kubernetes Dashboard is deployed."
  value       = data.kubernetes_namespace.namespace.id
}

output "id" {
  description = "The Helm release ID for Kubernetes Dashboard."
  value       = helm_release.application.id
}

output "chart_reference" {
  description = "The Helm chart reference for Kubernetes Dashboard."
  value       = local.chart_reference
}

output "service_address" {
  description = "The address of the Kubernetes Dashboard service."
  value       = "${helm_release.application.id}.${data.kubernetes_namespace.namespace.id}.svc"
}

output "ingress_enabled" {
  description = "Whether ingress is enabled for the Home Assistant service."
  value       = var.ingress_enabled
}

output "ingress_address" {
  description = "The ingress address of the Home Assistant service."
  value       = var.ingress_host_address
}
