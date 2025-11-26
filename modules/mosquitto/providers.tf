terraform {
  required_providers {
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
