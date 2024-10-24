# Configure the Kubernetes provider with the path to your kubeconfig file
provider "kubernetes" {
  config_path = "~/.kube/config" # Replace with the actual path to your kubeconfig file
}

# Configure the Helm provider
provider "helm" {
  kubernetes {
    config_path = "~/.kube/config" # Replace with the actual path to your kubeconfig file
  }
}


provider "authentik" {
  url   = "https://authentik.myapp.com"
  token = "token-value"
  # Optionally set insecure to ignore TLS Certificates
  # insecure = true
  # Optionally add extra headers
  # headers {
  #   X-my-header = "foo"
  # }
}