variable "namespace" {
  description = "The namespace in which to deploy the Home Assistant environment."
  type        = string
  default     = "homeassistant"
}

variable "python_executable" {
  description = "The Python executable to use for running the Mosquitto password hasher script. Must have the 'passlib' module installed."
  type        = string
  default     = "python3"
}

variable "ingress_class_name" {
  description = "The ingress class name to use for the Home Assistant environment."
  type        = string
  default     = "nginx"
}

variable "ingress_annotations" {
  description = "A map of annotations to add to the Home Assistant ingress."
  type        = map(string)
  default     = {}
}

variable "cloudflare_api_token" {
  description = "The Cloudflare API token for DNS01 challenge solving."
  type        = string
}

variable "mosquitto_admin_username" {
  description = "The admin username for the Mosquitto MQTT broker."
  type        = string
  default     = "admin"
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

variable "homeassistant_subdomain" {
  description = "The subdomain for Home Assistant."
  type        = string
  default     = "home"
}

variable "homeassistant_codeserver_subdomain" {
  description = "The subdomain for the Home Assistant Code Server."
  type        = string
  default     = "code"
}

variable "zigbee2mqtt_subdomain" {
  description = "The subdomain for Zigbee2MQTT."
  type        = string
  default     = "z2m"
}

variable "zfs_pool_name" {
  description = "The name of the ZFS pool to use for storage."
  type        = string
  default     = "zfspv-pool"
}

variable "enable_persistent_storage" {
  description = "Whether to enable persistent storage for the Home Assistant environment."
  type        = bool
  default     = true
}

variable "storage_class_reclaim_policy" {
  description = "The reclaim policy for the storage class."
  type        = string
  default     = "Retain"
}

variable "homeassistant_storage_size" {
  description = "The size of the persistent volume for Home Assistant."
  type        = string
  default     = "32Gi"
}

variable "mosquitto_storage_size" {
  description = "The size of the persistent volume for Mosquitto."
  type        = string
  default     = "8Gi"
}

variable "zigbee2mqtt_storage_size" {
  description = "The size of the persistent volume for Zigbee2MQTT."
  type        = string
  default     = "8Gi"
}
