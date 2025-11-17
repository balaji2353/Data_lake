resource "aws_dms_replication_instance" "this" {
  replication_instance_id    = var.replication_instance_id
  replication_instance_class = var.replication_instance_class
  allocated_storage          = var.allocated_storage
  engine_version             = var.engine_version
  publicly_accessible        = var.publicly_accessible
  multi_az                   = var.multi_az

  tags = var.tags
}
