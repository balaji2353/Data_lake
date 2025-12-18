terraform {
  backend "s3" {    
    bucket = "taxdatatest"
    key    = "redshift/prod/terraform.tfstate"
    region = "ap-south-1"
  }
}