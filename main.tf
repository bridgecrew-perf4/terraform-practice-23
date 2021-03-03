terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}

module "s3" {
  source = "./modules/s3"
}

module "iam" {
  source = "./modules/iam"
}

module "security_groups" {
  source = "./modules/security_groups"
}

module "lambdas" {
  source = "./modules/lambdas"
}