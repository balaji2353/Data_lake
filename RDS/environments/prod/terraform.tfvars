cluster_identifier = "metadata-db-prod"
engine              = "postgres"
engine_version      = "15.4"
master_username     = "postgres"
manage_master_user_password = true
skip_final_snapshot = false
backup_retention_period = 30
preferred_backup_window = "03:00-04:00"
enabled_cloudwatch_logs_exports = ["postgresql"]
deletion_protection = true
tags = {
  Environment = "prod"
  Project     = "Data Lake"
}
