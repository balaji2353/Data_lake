terraform {
  backend "s3" {    
    bucket = "taxdatatest/terraform-state"
    key    = "redshift/prod/terraform.tfstate"
    region = "ap-south-1"
  }
}