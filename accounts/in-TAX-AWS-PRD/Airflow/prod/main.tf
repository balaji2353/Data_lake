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
  source = "../modules/mwaa"

  environment              = "prod"
  airflow_environment_name = "Deloitte-airflow"
  dag_s3_path              = "DAG/"
  source_bucket_arn        = "arn:aws:s3:::airflowtest-datalake"
  execution_role_arn       = "arn:aws:iam::337693406343:role/service-role/AmazonMWAA-airflowtest1-1UlG7I"
  security_group_ids       = ["sg-0031fa76172eee124"]
  subnet_ids               = ["subnet-01713a7af70f16cb1", "subnet-09e1e70bca7be1488"]

  # Prod-specific configurations
  environment_class               = "mw1.medium"
  airflow_version                 = "3.0.6"
  max_workers                     = 10
  min_workers                     = 1
  schedulers                      = 2
  max_webservers                  = 2
  min_webservers                  = 2
  weekly_maintenance_window_start = "MON:19:30"
  webserver_access_mode           = "PRIVATE_ONLY"
  worker_replacement_strategy     = "FORCED"

  tags = {
    CSCLASS          = "Confidential"
    CSQUAL           = "Financial Information"
    COUNTRY          = "IN"
    GROUPCONTACT     = "intaxitplatform@deloitte.com"
    SECONDARYCONTACT = "anahitavarma@deloitte.com"
    FUNCTION         = "Tax"
    PRIMARYCONTACT   = "vveer@deloitte.com"
    CMS              = "IN-ITS"
    ENVIRONMENT      = "Production"
    BILLINGCODE      = "FPTN0002"
    BILLINGCONTACT   = "msirsat@deloitte.com"
    CSTYPE           = "Internal"
    Project          = "Deloitte"
    CostCenter       = "Deloitte_India_ITAX"
    Owner            = "Deloitte"
    ManagedBy        = "Terraform"
  }
}
