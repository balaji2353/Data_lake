terraform {
  backend "s3" {    
    bucket = "taxdatatest/terraform-state"
    key    = "dms/prod/terraform.tfstate"
    region = "ap-south-1"
  }
}