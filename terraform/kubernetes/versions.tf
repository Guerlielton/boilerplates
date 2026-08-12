terraform {
  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
    authentik = {
      source  = "goauthentik/authentik"
      version = "2026.5.1"
    }
  }
  required_version = ">= 1.0.0"


}
