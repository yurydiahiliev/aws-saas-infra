module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster_name
  cluster_version = "1.27"
  subnets         = module.vpc.private_subnets

  node_groups = {
    eks_nodes = {
      desired_capacity = var.desired_capacity
      max_capacity     = 4
      min_capacity     = 1

      instance_type = var.node_instance_type
    }
  }

  vpc_id = module.vpc.vpc_id

  tags = {
    Name = var.cluster_name
  }
}