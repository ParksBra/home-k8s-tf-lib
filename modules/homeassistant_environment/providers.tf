terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~> 2.38.0"
    }
    kubectl = {
      source = "alekc/kubectl"
      version = "~> 2.1.3"
    }
    helm = {
      source = "hashicorp/helm"
      version = "~> 3.1.1"
    }
    jinja = {
      source = "NikolaLohinski/jinja"
      version = "~> 2.4.3"
    }
  }
}
