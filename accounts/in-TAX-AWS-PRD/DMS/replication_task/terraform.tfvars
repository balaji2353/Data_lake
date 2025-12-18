replication_task_id = "bolton-gstplus"
migration_type      = "full-load-and-cdc"
cdc_start_time      = "2025-12-01T05:50:00Z"
table_mappings_path = "../prod/table-mappings.json"
tags = {
  Environment = "dev"
}
replication_instance_arn = "arn:aws:dms:::replication-instance/bolton-rep-instance"
source_endpoint_arn      = "arn:aws:dms:::endpoint/bolton-gst-analytics"
target_endpoint_arn      = "arn:aws:dms:::endpoint/bolton-target-gstin"
