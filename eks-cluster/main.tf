resource "aws_eks_cluster" "meks" {
  name     = var.cluster-name
  role_arn = var.role_arn_cluster

  vpc_config {
    security_group_ids = [var.security_groups]
    subnet_ids         = var.subnet_ids_cluster
  }

  depends_on = [
    var.cluster_policy_attach,
    var.service_policy_attach,
  ]
}