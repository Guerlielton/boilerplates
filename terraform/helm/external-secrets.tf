resource "helm_release" "external-secrets" {
  name = "external-secrets"

  repository       = "https://charts.external-secrets.io"
  chart            = "external-secrets"
  namespace        = "external-secrets"
  wait             = true
  create_namespace = true

  set {
    name  = "installCRDs"
    value = "true"
  }
}