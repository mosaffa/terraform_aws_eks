resource "aws_eks_node_group" "meks-nodes" {
  
  cluster_name    = var.cluster_name_n
  node_group_name = "meks-node-group"
  node_role_arn   = var.meks_node_role_arn
  subnet_ids      = var.subnet_ids_nodes

  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 1
  }

  depends_on = [
    var.worker_node_policy,
    var.node_cni_policy,
    var.node_cr_policy,
  ]
}