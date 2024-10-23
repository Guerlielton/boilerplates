# Boilerplates: Terraform, Helm & Kubernetes and some stuffs.

Welcome to the **Boilerplates** repository, where you'll find ready-to-use examples for automating infrastructure with **Terraform**, **Helm**, and **Kubernetes**. This repository is aimed at helping users automate the creation and management of Kubernetes environments by integrating popular provisioning and orchestration tools.

## Repository Structure

Below is the current directory structure:

```bash
├── LICENSE                 # Project license
├── README.md               # Documentation for the repository
├── renovate.json           # Renovate configuration for dependency updates
└── terraform               # Main directory for Terraform examples
    ├── helm                # Examples of integrating Terraform with Helm
    │   ├── external-secrets.tf       # External Secrets via Helm Chart
    │   ├── kube-prometheus-stack.tf  # Deploy kube-prometheus-stack using Helm
    │   ├── sealed-secrets.tf         # Sealed Secrets deployment via Helm Chart
    │   └── sonarqube.tf              # SonarQube deployment via Helm Chart
    └── kubernetes           # Basic Kubernetes resources using Terraform
        └── namespace.tf     # Example of creating namespaces in Kubernetes
```
