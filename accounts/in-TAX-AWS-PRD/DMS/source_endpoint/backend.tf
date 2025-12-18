terraform {
  backend "s3" {
    bucket = "YOUR_TERRAFORM_STATE_BUCKET"
    key    = "accounts/in-TAX-AWS-PRD/DMS/source_endpoint/source_endpoint.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}
