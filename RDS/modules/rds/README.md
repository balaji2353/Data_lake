# RDS Module

This module manages AWS Aurora RDS clusters.

## Inputs

- `cluster_identifier` (string) - RDS cluster identifier (required)
- `engine` (string) - Database engine (default: aurora-postgresql)
- `engine_version` (string) - Engine version (default: 15.4)
- `master_username` (string) - Master username (default: postgres, sensitive)
- `master_password` (string) - Master password (required, sensitive)
- `skip_final_snapshot` (bool) - Skip final snapshot on deletion (default: false)
- `backup_retention_period` (number) - Backup retention in days (default: 7)
- `preferred_backup_window` (string) - Backup window (default: 03:00-04:00)
- `enabled_cloudwatch_logs_exports` (list) - CloudWatch logs to export (default: [])
- `deletion_protection` (bool) - Enable deletion protection (default: false)
- `tags` (map) - Resource tags (default: {})

## Outputs

- `cluster_id` - RDS cluster ID
- `cluster_endpoint` - RDS cluster endpoint
- `cluster_arn` - RDS cluster ARN

## Example

module "rds" {
  source = "../modules/rds"

  cluster_identifier = "my-cluster"
  master_password    = "SecurePassword123"
  tags = {
    Environment = "dev"
  }
}
