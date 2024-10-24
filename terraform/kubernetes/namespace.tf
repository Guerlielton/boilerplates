resource "kubernetes_namespace" "stage" {
  metadata {
    name = "stage" # Name of namespace
  }
}

resource "kubernetes_namespace" "dev" {
  metadata {
    name = "dev" # Name of namespace
  }
}

resource "kubernetes_namespace" "poc" {
  metadata {
    name = "poc" # Name of namespace
  }
}

resource "kubernetes_namespace" "prod" {
  metadata {
    name = "prod" # Name of namespace
    labels = {
      istio-injection = "enabled"
    }
  }
}