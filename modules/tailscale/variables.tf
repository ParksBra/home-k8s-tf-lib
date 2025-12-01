# Chart vars
variable "namespace" {
  description = "The namespace in which to deploy the Helm chart."
  type        = string
  default     = null
}

variable "create_namespace" {
  description = "Whether to create the namespace for the module."
  type        = bool
  default     = true
}

variable "chart_install_name" {
  description = "The name used to install the Helm chart."
  type        = string
  default     = null
}

variable "chart_version" {
  description = "The version of the Helm chart to deploy. If null, the latest version is used."
  type        = string
  default     = null
}

variable "chart_linting_enabled" {
  description = "Whether to enable Helm chart linting."
  type        = bool
  default     = true
}

variable "chart_recreate_pods" {
  description = "Whether to recreate pods when deploying the Helm chart."
  type        = bool
  default     = false
}

variable "chart_upgrade_install" {
  description = "Whether to install the Helm chart if it is not already installed during an upgrade."
  type        = bool
  default     = true
}

variable "chart_replace" {
  description = "Whether to replace the Helm chart if it is already installed."
  type        = bool
  default     = false
}

variable "chart_dependency_update" {
  description = "Whether to update chart dependencies before installing or upgrading the Helm chart."
  type        = bool
  default     = true
}

variable "chart_cleanup_on_fail" {
  description = "Whether to cleanup resources if the Helm chart installation or upgrade fails."
  type        = bool
  default     = true
}

# OpenEBS ZFS specific vars
variable "oauth_client_id" {
  description = "The OAuth Client ID for Tailscale operator authentication."
  type        = string
  default     = null
  sensitive   = true
}

variable "oauth_client_secret" {
  description = "The OAuth Client Secret for Tailscale operator authentication."
  type        = string
  default     = null
  sensitive   = true
}

variable "operator_default_tags" {
  description = "Default tags to add to Tailscale entries."
  type        = list
  default     = [
    "tag:k8s-operator"
  ]
}

variable "operator_image_repository" {
  description = "The Tailscale image repository to use for the operator."
  type        = string
  default     = "tailscale/k8s-operator"
}

variable "operator_image_tag" {
  description = "The Tailscale image tag to use for the operator."
  type        = string
  default     = "latest"
}

variable "operator_image_pull_policy" {
  description = "The image pull policy for the operator."
  type        = string
  default     = "Always"
}

variable "proxy_default_tags" {
  description = "Default tags to add to Tailscale proxy entries."
  type        = list
  default     = [
    "tag:k8s"
  ]
}

variable "proxy_image_repository" {
  description = "The Tailscale image repository to use for the proxy DaemonSet."
  type        = string
  default     = "tailscale/tailscale"
}

variable "proxy_image_tag" {
  description = "The Tailscale image tag to use for the proxy DaemonSet."
  type        = string
  default     = "latest"
}

variable "proxy_image_pull_policy" {
  description = "The image pull policy for the proxy DaemonSet."
  type        = string
  default     = "Always"
}

variable "ingress_class_name" {
  description = "The ingress class name to use for the Tailscale ingress controller. Used by load balancer services."
  type        = string
  default     = "tailscale"
}
