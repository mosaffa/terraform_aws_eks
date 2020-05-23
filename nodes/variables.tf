variable "cluster_name_n" {}
variable "meks_node_role_arn" {}
variable "subnet_ids_nodes" {
    type = list
}
variable "worker_node_policy" {}
variable "node_cni_policy" {}
variable "node_cr_policy" {}