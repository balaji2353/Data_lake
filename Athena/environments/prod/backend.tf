terraform {
  backend "s3" {    
    bucket = "taxdatatest/terraform-state"
    key    = "athena/prod/terraform.tfstate"
    region = "ap-south-1"
  }
}