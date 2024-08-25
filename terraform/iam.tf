resource "aws_iam_role" "eks_role" {
  name = "eks-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    Name = "eks-role"
  }
}

resource "aws_iam_policy" "eks_policy" {
  name = "eks-policy"
  description = "Policy for EKS to manage ELB"

  policy = file("iam/iam-policy.json")
}

resource "aws_iam_role_policy_attachment" "eks_attach_policy" {
  role       = aws_iam_role.eks_role.name
  policy_arn = aws_iam_policy.eks_policy.arn
}