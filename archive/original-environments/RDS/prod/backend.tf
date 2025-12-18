terraform {
  backend "s3" {    
    bucket = "taxdatatest"
    key    = "rds/prod/terraform.tfstate"
    region = "ap-south-1"
  }
}