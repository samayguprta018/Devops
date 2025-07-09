module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "20.37.1" 
  cluster_name    = "hello"
  cluster_version = "1.29"
  subnet_ids      = ["subnet-0b03c9c53f1d5fffa", "subnet-0797d6058a0660759"]
  vpc_id          = "vpc-0780cc803a9b17876"
  enable_irsa     = true

  eks_managed_node_groups = {
    eks_nodes = {
      desired_size = 2
      max_size     = 3
      min_size     = 1

      instance_types = ["t3.medium"]
    }
  }
}
