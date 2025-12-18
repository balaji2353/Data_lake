terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 6.20.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"

  default_tags {
    tags = {
      Project = "Deloitte"
      CMS     = "IN-ITS"
    }
  }
}

data "aws_secretsmanager_secret_version" "rds_creds" {
  count     = var.secrets_manager_secret_name != null ? 1 : 0
  secret_id = var.secrets_manager_secret_name
}

locals {
  rds_secrets = var.secrets_manager_secret_name != null ? jsondecode(data.aws_secretsmanager_secret_version.rds_creds[0].secret_string) : {}
}

module "rds_cluster" {
  source = "../modules/rds"

  cluster_identifier = "taxdata-rds-cluster-prod"
  engine             = "aurora-postgresql"
  engine_version     = "13.6"

  master_username = lookup(local.rds_secrets, "username", var.master_username)
  master_password = lookup(local.rds_secrets, "password", var.master_password)
}
