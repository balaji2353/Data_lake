resource "null_resource" "replication_instance" {}

locals {
  arn = "arn:aws:dms:::replication-instance/${var.replication_instance_id}"
}
