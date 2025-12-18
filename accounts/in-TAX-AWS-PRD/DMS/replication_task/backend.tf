terraform {
  backend "s3" {
    bucket = "YOUR_TERRAFORM_STATE_BUCKET"
    key    = "accounts/in-TAX-AWS-PRD/DMS/replication_task/replication_task.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}
