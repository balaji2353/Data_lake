source_endpoint_id         = "bolton-gst-analytics"
source_engine_name         = "sqlserver"
source_username            = "DMSForITP"
source_password            = "YourPassword123!"
source_server_name         = "in-bolton-uat-db.cqd9d5qa5zwv.ap-south-1.rds.amazonaws.com"
source_port                = 1433
source_database_name       = "GSTPlusAnalytics"

target_endpoint_id         = "bolton-target-gstin"
target_bucket_name         = "taxdata-lake-bronze-uat"
target_iam_role_name       = "dms-s3-target-role"

replication_instance_id    = "bolton-rep-instance"
replication_instance_class = "dms.t3.micro"
allocated_storage          = 100
engine_version             = "3.5.4"

replication_task_id        = "bolton-gstplus"
migration_type             = "full-load-and-cdc"
cdc_start_time             = "2025-12-01T05:50:00Z"

tags = {
  Environment = "dev"
  Name        = "dms-bolton"
}
