output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.aws_vpc.vpc_id
}

output "subnet_ids" {
  description = "The IDs of the subnets"
  value       = module.aws_vpc.public_subnets
}

output "eks_cluster_endpoint" {
  description = "The endpoint of the EKS cluster"
  value       = module.eks.cluster_endpoint
}