variable "cluster-name" {}
variable "role_arn_cluster" {}
variable "security_groups" {}
variable "subnet_ids_cluster" {
    type = list
}
variable "cluster_policy_attach" {}
variable "service_policy_attach" {}