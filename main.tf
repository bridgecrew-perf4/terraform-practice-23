terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider in us-west-2
provider "aws" {
  region = "us-west-2"
  assume_role {
    role_arn     = "arn:aws:iam::546607823400:role/rhassan-full-access"
    session_name = "rhassan_session"
  }
}


# Configure the AWS Provider in us-east-1
provider "aws" {
  alias  = "east"
  region = "us-east-1"
}

# -------------------------------------Modules-------------------------------------------------
module "iam" {
  source = "./modules/iam"
}

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
# }

# module "workflow" {
#   source = "./modules/workflow"
# }

# module "ec2" {
#   source = "./modules/ec2"
# }

module "api-gateway" {
  source = "./modules/api-gateway"
}