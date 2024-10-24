terraform {
  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
    authentik = {
      source  = "goauthentik/authentik"
      version = "2024.8.3"
    }
  }
  required_version = ">= 1.0.0"


}
