# remote state 

data "terraform_remote_state" "remote_state" {
  backend = "s3"

  config = {
    bucket = "onekloud-swagwatch-infra"
    key    = "onekloud-swagwatch-infra/dev/tf.state"
    region = "us-east-2"
  }
}

#--------------------------------------------------------------------------

# eks 

data "aws_caller_identity" "current" {}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}

provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.cluster.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
    token                  = data.aws_eks_cluster_auth.cluster.token
  }
}

#--------------------------------------------------------------------------

