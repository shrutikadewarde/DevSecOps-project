module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "20.8.4"
 

  cluster_name    = var.cluster_name
  cluster_version = "1.28"
  
  vpc_id          = var.vpc_id
  subnet_ids      = var.subnet_ids
  

  cluster_endpoint_public_access = true

  eks_managed_node_groups = {
    default = {
      min_size     = 1  
      max_size     = 3
      desired_size = 2
      
      

      instance_types = ["t3.medium"]
      capacity_type  = "ON_DEMAND"
    }
  }

    enable_irsa = true
}

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  token                  = data.aws_eks_cluster_auth.cluster.token
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_name
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_name
}

resource "kubernetes_namespace" "ingress_nginx" {
  metadata {
    name = "ingress-nginx"
  }
  depends_on = [module.eks]
}
