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

# module "iam" {
#   source = "./modules/iam"
# }

# module "security_groups" {
#   source = "./modules/security_groups"
# }

# module "lambdas" {
#   source = "./modules/lambdas"
# }

# module "rds" {
#   source = "./modules/rds"
# }

# module "sqs" {
#   source = "./modules/sqs"
#   retention_time = 3600
#   delay_seconds = 5
# }

# module "workflow" {
#   source = "./modules/workflow"
# }

# module "ec2" {
#   source = "./modules/ec2"
# }

module "s3" {
  source = "./modules/s3"
}

module "git_remote" {
  source = "git::https://github.com/rizbi-hassan/terraform-practice.git?ref=develop"
}