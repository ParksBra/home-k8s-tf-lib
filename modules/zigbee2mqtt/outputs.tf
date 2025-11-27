output "namespace" {
  description = "The namespace where Zigbee2MQTT is deployed."
  value       = data.kubernetes_namespace.namespace.id
}

output "namespace_name" {
  description = "The name of the namespace in which Zigbee2MQTT is deployed."
  value       = data.kubernetes_namespace.namespace.metadata[0].name
}

output "id" {
  description = "The name used to install the Zigbee2MQTT Helm chart."
  value       = helm_release.application.id
}

output "chart_reference" {
  description = "The Helm chart reference for Zigbee2MQTT."
  value       = local.chart_reference
}

output "service_address" {
  description = "The address of the Zigbee2MQTT service."
  value       = "${helm_release.application.id}.${data.kubernetes_namespace.namespace.id}.svc"
}

output "service_port" {
  description = "The port of the Home Assistant service."
  value       = var.service_port
}

output "ingress_enabled" {
  description = "Whether ingress is enabled for the Home Assistant service."
  value       = var.ingress_enabled
}

output "ingress_address" {
  description = "The ingress address of the Home Assistant service."
  value       = var.ingress_host_address
}

output "tls_secret_name" {
  description = "The name of the TLS secret used for Zigbee2MQTT ingress."
  value       = local.tls_secret_name
}
