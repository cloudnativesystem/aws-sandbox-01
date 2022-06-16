# Security Groups

# Default Security Group
resource "aws_default_security_group" "default" {
  vpc_id = local.vpc_id

  tags = {
    Name   = "${var.vpc_name}-default-sg"
    access = "public"
    env    = var.environment
  }
}

# Private Security Group
resource "aws_security_group" "private" {
  vpc_id = local.vpc_id

  tags = {
    Name   = "${var.vpc_name}-private-sg"
    access = "private"
    env    = var.environment
  }
}

# Public Security Group
resource "aws_security_group" "public" {
  vpc_id = local.vpc_id

  tags = {
    Name   = "${var.vpc_name}-public-sg"
    access = "public"
    env    = var.environment
  }
}

# Cluster Security Group
resource "aws_security_group" "cluster" {
  vpc_id = local.vpc_id

  tags = {
    Name   = "${var.vpc_name}-cluster-sg"
    access = "private"
    env    = var.environment
  }
}