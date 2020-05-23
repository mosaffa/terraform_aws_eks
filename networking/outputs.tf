#-----networking/outputs.tf----

output "public_subnets" {
  value = "${aws_subnet.tf_public_subnet.*.id}"
}


output "subnet_ips" {
  value = "${aws_subnet.tf_public_subnet.*.cidr_block}"
}


output "security_groups" {
  value = aws_security_group.meks-cluster-sg.id
}

output "subnet_ids_cluster" {
  value = aws_subnet.tf_public_subnet[*].id
}
