#!/bin/bash

set -e

echo "Updating Terraform configuration..."
cd ../terraform
terraform apply -auto-approve

echo "Updating Helm charts..."
cd ../helm-charts
helm upgrade traefik traefik/traefik -f traefik/traefik-values.yaml
helm upgrade selenium-grid selenium-grid/

echo "Update complete."