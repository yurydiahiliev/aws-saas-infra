variable "region" {
  description = "AWS Region"
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "EKS Cluster Selenium Grid"
  default     = "my-eks-cluster"
}

variable "node_instance_type" {
  description = "EC2 instance type for EKS worker nodes"
  default     = "t2.micro"
}

variable "desired_capacity" {
  description = "Desired number of worker nodes"
  default     = 3
}