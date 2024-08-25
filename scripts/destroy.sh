#!/bin/bash

set -e

echo "Destroying Helm deployments..."
helm delete selenium-grid
helm delete traefik

echo "Destroying Terraform infrastructure..."
cd ../terraform
terraform destroy -auto-approve

echo "Teardown complete."
