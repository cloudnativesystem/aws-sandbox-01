# outputs.tf

output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = module.vpc.vpc_arn
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_block
}

output "vpc_owner_id" {
  description = "The ID of the AWS account that owns the VPC"
  value       = module.vpc.vpc_owner_id
}

output "private_us_east_2a_sn" {
  description = "private_us_east_2a_sn"
  value       = module.vpc.private_us_east_2a_sn
}
/*
output "private_us_east_2b_sn" {
  description = "private_us_east_2b_sn"
  value       = module.vpc.private_us_east_2b_sn
}*/

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}

output "private_subnet_arns" {
  description = "List of ARNs of private subnets"
  value       = module.vpc.private_subnet_arns
}

output "private_subnets_cidr_blocks" {
  description = "List of cidr_blocks of private subnets"
  value       = module.vpc.private_subnets_cidr_blocks
}

output "public_us_east_2a_sn" {
  description = "public_us_east_2a_sn"
  value       = module.vpc.public_us_east_2a_sn
}
/*
output "public_us_east_2b_sn" {
  description = "public_us_east_2b_sn"
  value       = module.vpc.public_us_east_2b_sn
}*/

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets
}

output "public_subnet_arns" {
  description = "List of ARNs of public subnets"
  value       = module.vpc.public_subnet_arns
}

output "public_subnets_cidr_blocks" {
  description = "List of cidr_blocks of public subnets"
  value       = module.vpc.public_subnets_cidr_blocks
}

output "public_us_east_2_rt_id" {
  description = "public_us_east_2_rt"
  value       = module.vpc.public_us_east_2_rt_id
}

output "public_us_east_2_rt_arn" {
  description = "public_us_east_2_rt"
  value       = module.vpc.public_us_east_2_rt_arn
}

output "private_us_east_2a_rt_id" {
  description = "private_us_east_2a_rt"
  value       = module.vpc.private_us_east_2a_rt_id
}

output "private_us_east_2a_rt_arn" {
  description = "private_us_east_2a_rt_arn"
  value       = module.vpc.private_us_east_2a_rt_arn
}

output "default_nacl_id" {
  description = "default nacl id"
  value       = module.vpc.default_nacl_id
}

output "default_nacl_arn" {
  description = "default nacl arn"
  value       = module.vpc.default_nacl_arn
}

output "private_nacl_id" {
  description = "private nacl id"
  value       = module.vpc.private_nacl_id
}

output "private_nacl_arn" {
  description = "private nacl arn"
  value       = module.vpc.private_nacl_arn
}

output "public_nacl_id" {
  description = "public nacl id"
  value       = module.vpc.public_nacl_id
}

output "public_nacl_arn" {
  description = "public nacl arn"
  value       = module.vpc.public_nacl_arn
}

output "default_sg_id" {
  description = "default security group id"
  value       = module.vpc.default_sg_id
}

output "default_sg_arn" {
  description = "default security group arn"
  value       = module.vpc.default_sg_arn
}

output "private_sg_id" {
  description = "private security group id"
  value       = module.vpc.private_sg_id
}

output "private_sg_arn" {
  description = "private security group arn"
  value       = module.vpc.private_sg_arn
}

output "public_sg_id" {
  description = "public security group id"
  value       = module.vpc.public_sg_id
}

output "public_sg_arn" {
  description = "public security group arn"
  value       = module.vpc.public_sg_arn
}

output "cluster_sg_id" {
  description = "cluster security group id"
  value       = module.vpc.cluster_sg_id
}

output "cluster_sg_arn" {
  description = "cluster security group arn"
  value       = module.vpc.cluster_sg_arn
}