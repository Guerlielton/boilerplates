// External Secrets
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

// Kube prometheus stack
resource "helm_release" "kube_prometheus_stack" {
  name             = "kube-prometheus-stack"
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "kube-prometheus-stack"
  namespace        = "monitor"
  create_namespace = true
  values           = [file("${path.module}/prometheus/values.yaml")]
}
// Sealed Secrets
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

// Sonarqube
resource "helm_release" "sonarqube" {
  name             = "sonarqube"
  repository       = "https://SonarSource.github.io/helm-chart-sonarqube"
  chart            = "sonarqube"
  namespace        = "sonarqube"
  create_namespace = true
  version          = "2025.3.1" # Chart Version
  values           = [file("${path.module}/sonarqube/values.yaml")]

  lifecycle {
    ignore_changes = [values, metadata]
  }
}

// NGINX
resource "helm_release" "ingress-nginx" {
  name = "ingress-nginx"

  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  namespace        = "ingress-nginx"
  wait             = true
  timeout          = 600
  create_namespace = true

  set {
    name  = "letsEncrypt.ingress.class"
    value = "nginx"
  }
  set {
    name  = "ingress.extraAnnotations.'cert-manager.io/cluster-issuer'"
    value = "letsencrypt-prod"
  }

  set {
    name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/oci-load-balancer-shape"
    value = "flexible"
  }

  set {
    name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/oci-load-balancer-shape-flex-min"
    value = "10"
  }

  set {
    name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/oci-load-balancer-shape-flex-max"
    value = "10"
  }
}