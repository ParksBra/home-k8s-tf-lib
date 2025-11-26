variable "namespace" {
  description = "The namespace in which to deploy the Home Assistant environment."
  type        = string
  default     = "homeassistant"
}

variable "cloudflare_api_token" {
  description = "The Cloudflare API token for DNS01 challenge solving."
  type        = string
}

variable "mosquitto_admin_password" {
  description = "The admin password for the Mosquitto MQTT broker."
  type        = string
  sensitive   = true
}

variable "acme_email" {
  description = "The email address to use for ACME certificate registration."
  type        = string
}

variable "cloudflare_email" {
  description = "The email address associated with the Cloudflare account."
  type        = string
}

variable "parent_domain" {
  description = "The parent domain for the Home Assistant environment."
  type        = string
}
