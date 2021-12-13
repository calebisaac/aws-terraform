
provider "kubernetes" {
  host                   = data.aws_eks_cluster.myapp-cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.myapp-cluster.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.myapp-cluster.token
}

data "aws_eks_cluster" "myapp-cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "myapp-cluster" {
  name = module.eks.cluster_id
}


module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version = "17.24.0"

  cluster_version = "1.21"
  cluster_name    = "myapp-eks-cluster"

  subnets = module.myapp-vpc.private_subnets
  vpc_id = module.myapp-vpc.vpc_id

  tags = {
        environment = "development"
        application = "myapp"
    }


  worker_groups = [
    {
      instance_type = "t2.micro"
      asg_desired_capacity = 10
      asg_max_size  = 15
    }
  ]
}