output "role_arn_cluster" {
   value = aws_iam_role.meks-cluster.arn
}
output "cluster_policy_attach" {
   value = aws_iam_role_policy_attachment.meks-cluster-AmazonEKSClusterPolicy
}
output "service_policy_attach" {
    value = aws_iam_role_policy_attachment.meks-cluster-AmazonEKSServicePolicy
}
output "meks_node_role_arn" {
    value = aws_iam_role.meks-node.arn
}
output "worker_node_policy" {
    value = aws_iam_role_policy_attachment.meks-node-AmazonEKSWorkerNodePolicy
}
output "node_cni_policy" {
    value = aws_iam_role_policy_attachment.meks-node-AmazonEKS_CNI_Policy
}
output "node_cr_policy" {
    value = aws_iam_role_policy_attachment.meks-node-AmazonEC2ContainerRegistryReadOnly
}
