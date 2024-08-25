#!/bin/bash

set -e

echo "Deploying infrastructure with Terraform..."
cd ../terraform
terraform apply -auto-approve

echo "Setting up Kubernetes context..."
aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)

echo "Deploying Helm charts..."
cd ../helm-charts
helm repo add traefik https://traefik.github.io/charts
helm repo update
helm install traefik traefik/traefik -f traefik/traefik-values.yaml
helm install selenium-grid selenium-grid/

echo "Deployment complete."
