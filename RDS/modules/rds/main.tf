resource "aws_rds_cluster" "this" {
  cluster_identifier        = var.cluster_identifier
  engine                    = var.engine
  engine_version            = var.engine_version
  master_username           = var.master_username
  master_password           = var.master_password
  skip_final_snapshot       = var.skip_final_snapshot
  backup_retention_period   = var.backup_retention_period
  preferred_backup_window   = var.preferred_backup_window
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports
  deletion_protection       = var.deletion_protection
  tags                      = var.tags
}
