output "namespace" {
  description = "The name of the namespace in which the Ingress NGINX controller is deployed."
  value       = data.kubernetes_namespace.namespace.metadata[0].name
}

output "chart_id" {
  description = "The Helm release ID for the Ingress NGINX controller."
  value       = helm_release.application.id
}

output "chart_name" {
  description = "The Helm chart reference for the Ingress NGINX controller."
  value       = helm_release.application.name
}

output "http_port" {
  description = "The HTTP port exposed by the Ingress NGINX controller."
  value       = var.service_http_port
}

output "https_port" {
  description = "The HTTPS port exposed by the Ingress NGINX controller."
  value       = var.service_https_port
}

output "loadbalancer_ip" {
  description = "The LoadBalancer IP address assigned to the Ingress NGINX controller service. Null if service type is not LoadBalancer."
  value       = local.loadbalancer_ip
}
