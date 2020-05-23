#----root/main.tf-----

provider "aws" {
  region     = var.aws_region
  access_key = var.access_key
  secret_key = var.secret_key
}

# Deploy IAM role
module "iam" {
  source = "./iam"
}

# Deploy Networking Resources
module "networking" {
  source       = "./networking"
  vpc_cidr     = var.vpc_cidr
  public_cidrs = var.public_cidrs
  accessip     = var.accessip
}

# Deploy EKS Cluster
module "eks-cluster" {
  source                = "./eks-cluster"
  cluster-name          = var.cluster-name
  role_arn_cluster      = module.iam.role_arn_cluster
  security_groups       = module.networking.security_groups
  subnet_ids_cluster    = module.networking.subnet_ids_cluster
  cluster_policy_attach = module.iam.cluster_policy_attach
  service_policy_attach = module.iam.service_policy_attach
}

# Deploy node group
module "nodes" {
  source             = "./nodes"
  cluster_name_n     = module.eks-cluster.cluster_name_n
  meks_node_role_arn = module.iam.meks_node_role_arn
  subnet_ids_nodes   = module.networking.subnet_ids_cluster
  worker_node_policy = module.iam.worker_node_policy
  node_cni_policy    = module.iam.node_cni_policy
  node_cr_policy     = module.iam.node_cr_policy
}