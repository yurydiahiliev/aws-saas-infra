resource "aws_security_group" "eks_cluster_sg" {
  name        = "eks-cluster-sg"
  vpc_id      = module.aws_vpc.vpc_id
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "eks_cluster_sg"
  }
}
module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "~> 20.0"
  cluster_name    = var.cluster_name
  cluster_version = "1.30"
  cluster_endpoint_public_access  = true
  subnet_ids      = module.aws_vpc.private_subnets
  cluster_security_group_id = aws_security_group.eks_cluster_sg.id

  eks_managed_node_groups = {
    eks_nodes = {
      desired_capacity = var.desired_capacity
      max_capacity     = 4
      min_capacity     = 1
      instance_type = var.node_instance_type
    }
  }

  enable_cluster_creator_admin_permissions = true

  tags = {
    Name = var.cluster_name
    Environment = "dev"
    Terraform   = "true"
  }
}
