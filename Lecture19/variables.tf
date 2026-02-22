variable "public_subnet_cidrs" {
  type = list(string)
  description = "Public subnet CIDR blocks"
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "private_subnet_cidrs" {
  type = list(string)
  description = "Private subnet CIDR blocks"
  default = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "cluster_name" {
  type    = string
  default = "demo-eks-tf"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "kubernetes_version" {
  type    = string
  default = "1.35"
}

locals {
    account = {
      id = "798974632222"
    }
}