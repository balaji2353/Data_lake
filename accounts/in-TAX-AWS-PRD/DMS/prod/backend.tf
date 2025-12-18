terraform {
	backend "s3" {
		bucket = "taxdatatest"
		key    = "dms/prod/terraform.tfstate"
		region = "ap-south-1"
	}
}