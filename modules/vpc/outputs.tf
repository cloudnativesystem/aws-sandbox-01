output "vpc_id" {
  description = "The ID of the VPC"
  value       = concat(aws_vpc.this.*.id, [""])[0]
}

output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = concat(aws_vpc.this.*.arn, [""])[0]
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = concat(aws_vpc.this.*.cidr_block, [""])[0]
}

output "vpc_owner_id" {
  description = "The ID of the AWS account that owns the VPC"
  value       = concat(aws_vpc.this.*.owner_id, [""])[0]
}

output "private_us_east_2a_sn" {
  description = "private_us_east_2a_sn"
  value       = aws_subnet.private[0].id
}
/*
output "private_us_east_2b_sn" {
  description = "private_us_east_2b_sn"
  value       = aws_subnet.private[1].id
}*/

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = aws_subnet.private.*.id
}

output "private_subnet_arns" {
  description = "List of ARNs of private subnets"
  value       = aws_subnet.private.*.arn
}

output "private_subnets_cidr_blocks" {
  description = "List of cidr_blocks of private subnets"
  value       = aws_subnet.private.*.cidr_block
}

output "public_us_east_2a_sn" {
  description = "public_us_east_2a_sn"
  value       = aws_subnet.public[0].id
}
/*
output "public_us_east_2b_sn" {
  description = "public_us_east_2b_sn"
  value       = aws_subnet.public[1].id
}*/

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = aws_subnet.public.*.id
}

output "public_subnet_arns" {
  description = "List of ARNs of public subnets"
  value       = aws_subnet.public.*.arn
}

output "public_subnets_cidr_blocks" {
  description = "List of cidr_blocks of public subnets"
  value       = aws_subnet.public.*.cidr_block
}

output "public_us_east_2_rt_id" {
  description = "public_us_east_2_rt"
  value       = aws_route_table.public.id
}

output "public_us_east_2_rt_arn" {
  description = "public_us_east_2_rt"
  value       = aws_route_table.public.arn
}

output "private_us_east_2a_rt_id" {
  description = "private_us_east_2a_rt"
  value       = aws_route_table.private[0].id
}

output "private_us_east_2a_rt_arn" {
  description = "private_us_east_2a_rt_arn"
  value       = aws_route_table.private[0].arn
}

output "default_nacl_id" {
  description = "default nacl id"
  value       = aws_default_network_acl.default.id
}

output "default_nacl_arn" {
  description = "default nacl arn"
  value       = aws_default_network_acl.default.arn
}

output "private_nacl_id" {
  description = "private nacl id"
  value       = aws_network_acl.private.id
}

output "private_nacl_arn" {
  description = "private nacl arn"
  value       = aws_network_acl.private.arn
}

output "public_nacl_id" {
  description = "public nacl id"
  value       = aws_network_acl.public.id
}

output "public_nacl_arn" {
  description = "public nacl arn"
  value       = aws_network_acl.public.arn
}

output "default_sg_id" {
  description = "default security group id"
  value       = aws_default_security_group.default.id
}

output "default_sg_arn" {
  description = "default security group arn"
  value       = aws_default_security_group.default.arn
}

output "private_sg_id" {
  description = "private security group id"
  value       = aws_security_group.private.id
}

output "private_sg_arn" {
  description = "private security group arn"
  value       = aws_security_group.private.arn
}

output "public_sg_id" {
  description = "public security group id"
  value       = aws_security_group.public.id
}

output "public_sg_arn" {
  description = "public security group arn"
  value       = aws_security_group.public.arn
}

output "cluster_sg_id" {
  description = "cluster security group id"
  value       = aws_security_group.cluster.id
}

output "cluster_sg_arn" {
  description = "cluster security group arn"
  value       = aws_security_group.cluster.arn
}