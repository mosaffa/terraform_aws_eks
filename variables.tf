#----root/variables.tf-----
variable "aws_region" {}

variable "access_key" {}

variable "secret_key" {}

#-------networking variables
variable "vpc_cidr" {}
variable "public_cidrs" {
  type = list
}
variable "accessip" {}
variable "cluster-name" {}