# Traefik Helm Chart Configuration

This file provides configuration settings for deploying Traefik as an Ingress Controller on AWS EKS using Helm.

## Installation

```bash
helm repo add traefik https://traefik.github.io/charts
helm repo update
helm install traefik traefik/traefik -f traefik-values.yaml
