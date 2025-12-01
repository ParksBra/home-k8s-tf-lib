terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
      version = "~> 3"
    }
    jinja = {
      source = "NikolaLohinski/jinja"
      version = "~> 2"
    }
  }
}
