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

module "mwaa" {
  source = "../../modules/mwaa"

  environment                    = "dev"
  airflow_environment_name       = "Deloitte-airflow-dev"
  dag_s3_path                    = "DAG/"
  source_bucket_arn              = "arn:aws:s3:::airflowtest-datalake-dev"
  execution_role_arn             = "arn:aws:iam::337693406343:role/service-role/AmazonMWAA-airflow-dev"
  security_group_ids             = ["sg-DEV-SG-ID"]
  subnet_ids                     = ["subnet-DEV-SUBNET-1", "subnet-DEV-SUBNET-2"]
  
  # Dev-specific configurations (minimal)
  environment_class              = "mw1.small"
  airflow_version                = "3.0.6"
  max_workers                    = 2
  min_workers                    = 1
  schedulers                     = 1
  max_webservers                 = 1
  min_webservers                 = 1
  weekly_maintenance_window_start = "MON:02:00"
  webserver_access_mode          = "PRIVATE_ONLY"
  worker_replacement_strategy    = "ROLLING_ON_FAILURE"

  tags = {
    CSCLASS           = "Confidential"
    CSQUAL            = "Financial Information"
    COUNTRY           = "IN"
    GROUPCONTACT      = "intaxitplatform@deloitte.com"
    SECONDARYCONTACT  = "anahitavarma@deloitte.com"
    FUNCTION          = "Tax"
    PRIMARYCONTACT    = "vveer@deloitte.com"
    CMS               = "IN-ITS"
    ENVIRONMENT       = "Development"
    BILLINGCODE       = "FPTN0002"
    BILLINGCONTACT    = "msirsat@deloitte.com"
    CSTYPE            = "Internal"
    Project           = "Deloitte_data_lake"
    CostCenter        = "Deloitte_India_ITAX"
    Owner             = "Deloitte"
    ManagedBy         = "Terraform"
  }
}
