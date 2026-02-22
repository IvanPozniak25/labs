terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"

    }
  }
}
provider "aws" {
    region = "eu-north-1"
    allowed_account_ids = [local.account.id]
}

data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  azs = slice(data.aws_availability_zones.available.names, 0, 2)
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.5.1"

  name = "${var.cluster_name}-vpc"
  cidr = var.vpc_cidr

  azs            = local.azs
  public_subnets = ["10.0.0.0/24", "10.0.1.0/24"]

  enable_nat_gateway = false
  single_nat_gateway = false

  enable_dns_hostnames = true
  enable_dns_support   = true

  map_public_ip_on_launch = true

  tags = {
    "Project" = var.cluster_name
  }

  public_subnet_tags = {
    "kubernetes.io/role/elb" = "1"
  }
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = ">=21.0.0"

  name    = var.cluster_name
  kubernetes_version = var.kubernetes_version

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnets

  endpoint_public_access = true

  enable_cluster_creator_admin_permissions = true

  eks_managed_node_groups = {
    ng-a = {
      instance_types = ["t3.medium"]
      desired_size   = 1
      min_size       = 1
      max_size       = 2

      subnet_ids = module.vpc.public_subnets
    }

    ng-b = {
      instance_types = ["t3.medium"]
      desired_size   = 1
      min_size       = 1
      max_size       = 2
      subnet_ids     = module.vpc.public_subnets
    }
  }

  tags = {
    "Project" = var.cluster_name
  }
}
