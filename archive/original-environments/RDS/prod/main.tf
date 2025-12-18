module "rds" {
  source = "../../modules/rds"

  cluster_identifier          = var.cluster_identifier
  engine                      = var.engine
  engine_version              = var.engine_version
  master_username             = coalesce(var.master_username, local.rds_secrets.username)
  master_password             = coalesce(var.master_password, local.rds_secrets.password)
  manage_master_user_password = var.manage_master_user_password
  skip_final_snapshot         = var.skip_final_snapshot
  backup_retention_period     = var.backup_retention_period
  preferred_backup_window     = var.preferred_backup_window
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports
  deletion_protection         = var.deletion_protection
  tags                        = var.tags
}

data "aws_secretsmanager_secret_version" "rds_prod" {
  secret_id = var.secrets_manager_secret_name
}

locals {
  rds_secrets = jsondecode(data.aws_secretsmanager_secret_version.rds_prod.secret_string)
}
