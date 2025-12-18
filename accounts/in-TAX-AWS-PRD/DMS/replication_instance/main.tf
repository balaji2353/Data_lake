module "replication_instance" {
  source = "../modules/dms_replication_instance"

  replication_instance_id    = var.replication_instance_id
  replication_instance_class = var.replication_instance_class
  allocated_storage          = var.allocated_storage
  engine_version             = var.engine_version

  tags = var.tags
}

output "replication_instance_id" {
  value = module.replication_instance.replication_instance_id
}

output "replication_instance_arn" {
  value = module.replication_instance.replication_instance_arn
}

locals {
  tags_decoded = var.tags_json != "" ? jsondecode(var.tags_json) : var.tags
}

/* override module tags if tags_json provided */
module "replication_instance_with_tags" {
  source = "../modules/dms_replication_instance"
  count  = var.tags_json != "" ? 1 : 0

  replication_instance_id    = var.replication_instance_id
  replication_instance_class = var.replication_instance_class
  allocated_storage          = var.allocated_storage
  engine_version             = var.engine_version

  tags = local.tags_decoded
}

output "replication_instance_arn_final" {
  value = var.tags_json != "" ? module.replication_instance_with_tags[0].replication_instance_arn : module.replication_instance.replication_instance_arn
}
