terraform {
  backend "s3" {    
    bucket = "taxdatatest/terraform-state"
    key    = "emr/prod/terraform.tfstate"
    region = "ap-south-1"
  }
}