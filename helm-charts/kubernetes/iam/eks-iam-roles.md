# EKS IAM Roles for Service Accounts

To allow Kubernetes to manage AWS resources like Load Balancers, you'll need to set up IAM roles with appropriate policies and associate them with Kubernetes service accounts.

## Steps

1. Create the IAM policy using the JSON file in this directory.
2. Create an IAM role with the `eks.amazonaws.com` trust relationship.
3. Attach the policy to the IAM role.
4. Associate the IAM role with a Kubernetes service account using IRSA (IAM Roles for Service Accounts).