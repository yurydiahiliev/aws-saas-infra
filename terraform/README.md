# Terraform Configuration for AWS EKS

This directory contains Terraform scripts to provision AWS infrastructure for an EKS cluster.

## Setup

1. Initialize Terraform:
   ```bash
   terraform init
   ```

2. Apply the configuration:
   ```bash
   terraform apply
   ```

   This will provision the VPC, EKS cluster, and related resources.

3. Output values like VPC ID, Subnet IDs, and EKS cluster endpoint will be displayed after successful execution.

## Customization

Modify the `variables.tf` file to adjust instance types, desired capacity, and other parameters.