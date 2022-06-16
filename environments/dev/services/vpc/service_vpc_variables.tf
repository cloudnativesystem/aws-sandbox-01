# vpc_variables.tf
variable "vpc_name" {
  description = "Name Of This VPC Resource"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR Block Of This VPC"
  type        = string
}

variable "vpc_azs" {
  description = "Availability Zones For This VPC"
  type        = list(string)
}

variable "vpc_private_subnets" {
  description = "The Private Subnets For This VPC"
  type        = list(string)
}

variable "vpc_public_subnets" {
  description = "The Public Subnets For This VPC"
  type        = list(string)
}

variable "enable_s3_endpoint" {
  description = "Determines whether or not an S3 endpoint is created"
  type        = bool
}

variable "vpc_tags" {
  description = "Tags Specific To This Resource"
  type        = map(string)
}

variable "dns_private_zone_name" {
  description = "private_zone"
  type        = string
}

variable "dns_public_zone_name" {
  description = "public_zone"
  type        = string
}

variable "dns_reverse_zone_name" {
  description = "reverse_zone"
  type        = string
}