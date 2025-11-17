variable "replication_instance_id" {
  description = "The replication instance identifier"
  type        = string
  default     = "default-replication-instance-id"
}

module "dms" {
  source = "./modules/dms"
  replication_instance_id = var.replication_instance_id
}

resource "aws_dms_replication_instance" "test-replication-instance" {
  replication_instance_id = "test-replication-instance"
  replication_instance_class = "dms.c6i.8xlarge"
  allocated_storage = 200
  engine_version = "3.5.4"
  publicly_accessible = false
    
 }
# import {
#   to = aws_dms_replication_instance.test-replication-instance
#   id = "test-replication-instance"
# }