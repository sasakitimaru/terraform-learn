terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}


# ECR
module "ecr" {
  source = "./modules/ecr"

  name_prefix = var.name_prefix
  region      = var.region
  account_id  = var.account_id
}

# IAM
module "iam" {
  source = "./modules/iam"

  name_prefix = var.name_prefix
  region      = var.region
}

# Network
module "network" {
  source = "./modules/network"

  name_prefix = var.name_prefix
  region      = var.region
}
