
resource "helm_release" "sonarqube" {
  name             = "sonarqube"
  repository       = "https://SonarSource.github.io/helm-chart-sonarqube"
  chart            = "sonarqube"
  namespace        = "sonarqube"
  create_namespace = true
  version          = "10.6.0" # Chart Version
  values           = [file("${path.module}/sonarqube/values.yaml")]
 
  lifecycle {
    ignore_changes = [values,metadata]
  }
}