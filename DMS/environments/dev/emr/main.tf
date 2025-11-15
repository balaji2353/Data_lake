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
}

module "emr_serverless" {
  source = "../../../modules/emr_serverless"

  environment              = "dev"
  application_name         = "taxdata-lake-EMR-dev"
  release_label            = "emr-7.0.0"
  application_type         = "SPARK"
  maximum_capacity_cpu     = "50"
  maximum_capacity_memory  = "500"

  initial_capacity = [
    {
      type         = "DRIVER"
      worker_count = 1
      cpu          = "2"
      memory       = "4g"
    },
    {
      type         = "EXECUTOR"
      worker_count = 1
      cpu          = "4"
      memory       = "16g"
    }
  ]

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
    Project           = "Deloitte"
  }
}
