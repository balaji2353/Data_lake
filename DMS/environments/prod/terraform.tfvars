# Production environment values - modify as needed for prod
source_endpoint_id         = "bolton-gst-analytics-prod"
source_engine_name         = "sqlserver"
source_username            = "DMSForITPProd"
source_password            = "YourProductionPassword123!"
source_server_name         = "prod-db.cqd9d5qa5zwv.ap-south-1.rds.amazonaws.com"
source_port                = 1433
source_database_name       = "GSTPlusAnalytics"

target_endpoint_id         = "bolton-target-gstin-prod"
target_bucket_name         = "taxdata-lake-bronze-prod"
target_iam_role_name       = "dms-s3-target-role-prod"

replication_instance_id    = "bolton-rep-instance-prod"
replication_instance_class = "dms.c6i.8xlarge"
allocated_storage          = 200
engine_version             = "3.5.4"

replication_task_id        = "bolton-gstplus-prod"
migration_type             = "full-load-and-cdc"
cdc_start_time             = "2025-12-01T05:50:00Z"

tags = {
  Environment = "prod"
  Name        = "dms-bolton-prod"
  ManagedBy   = "Terraform"
}

# Multi-item examples (preferred for multiple endpoints/tasks)
source_endpoints = {
  bolton = {
    endpoint_id   = "bolton-gst-analytics-prod"
    engine_name   = "sqlserver"
    username      = "DMSForITPProd"
    password      = "YourProductionPassword123!"
    server_name   = "prod-db.cqd9d5qa5zwv.ap-south-1.rds.amazonaws.com"
    port          = 1433
    database_name = "GSTPlusAnalytics"
    tags          = { Environment = "prod" }
  }
}

target_endpoints = {
  bolton = {
    endpoint_id   = "bolton-target-gstin-prod"
    bucket_name   = "taxdata-lake-bronze-prod"
    iam_role_name = "dms-s3-target-role-prod"
    tags          = { Environment = "prod" }
  }
}

# replication_tasks should be built in `main.tf` using module outputs.
