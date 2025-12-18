terraform {
  backend "s3" {
    # Replace these values or supply them via `terraform init -backend-config=...`
    bucket = "YOUR_TERRAFORM_STATE_BUCKET"
    key    = "accounts/in-TAX-AWS-PRD/DMS/replication_instance/replication_instance.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}
