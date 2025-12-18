terraform {
  backend "s3" {    
    bucket = "taxdatatest"
    key    = "athena/prod/terraform.tfstate"
    region = "ap-south-1"
  }
}