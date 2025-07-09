module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = jenkins
  cluster_version = "1.29"
  subnets         = subnet-0b03c9c53f1d5fffa
  vpc_id          = vpc-0780cc803a9b17876
  enable_irsa     = true
  manage_aws_auth = true

  node_groups = {
    eks_nodes = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1

      instance_types = ["t3.medium"]
    }
  }
}

