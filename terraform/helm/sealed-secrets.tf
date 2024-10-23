resource "helm_release" "sealed-secrets" {
  #   depends_on = [kubernetes_secret.sealed-secrets-key]
  chart      = "sealed-secrets"
  name       = "sealed-secrets"
  namespace  = "kube-system"
  repository = "https://bitnami-labs.github.io/sealed-secrets"

  set {
    name  = "createCustomResource"
    value = "true"
  }

  set {
    name  = "installCRDs"
    value = "true"
  }
 
}