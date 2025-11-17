cluster_identifier = "metadata-db-prod"
engine              = "aurora-postgresql"
engine_version      = "15.4"
master_username     = "postgres"
master_password     = "ProdSecurePassword456!"
skip_final_snapshot = false
backup_retention_period = 30
deletion_protection = true
tags = {
  Environment = "prod"
  Project     = "Data Lake"
}
