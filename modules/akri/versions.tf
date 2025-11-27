terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
      version = "~> 3"
    }
    time = {
      source = "hashicorp/time"
      version = "~> 0"
    }
  }
}

provider "time" {}
