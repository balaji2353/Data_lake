cluster_identifier = "metadata-db-test"
engine              = "aurora-postgresql"
engine_version      = "15.4"
master_username     = "postgres"
master_password     = "YourSecurePassword123!"
skip_final_snapshot = true
tags = {
  Environment = "dev"
  Project     = "Data Lake"
}
