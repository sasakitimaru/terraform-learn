terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
      region  = "ap-northeast-1"
    }
  }
  backend "s3" {
    bucket         = "terraform-example-bucket-20240615"
    key            = "terraform.tfstate"
    region         = "ap-northeast-1"
    encrypt        = true
    dynamodb_table = "terraform-example-terraform-locks"
  }
}


# ECR
module "ecr" {
  source = "../../modules/ecr"

  name_prefix = var.name_prefix
  region      = var.region
  account_id  = var.account_id
}

# IAM
module "iam" {
  source = "../../modules/iam"

  name_prefix = var.name_prefix
  region      = var.region
}

# Network
module "network" {
  source = "../../modules/network"

  name_prefix = var.name_prefix
  region      = var.region
}
