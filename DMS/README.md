# AWS DMS (Database Migration Service)

This folder contains Terraform configurations for DMS, including:
- **modules/** - Reusable DMS modules (endpoints, replication instance, replication task)
- **environments/dev** - Development environment configuration
- **environments/prod** - Production environment configuration (future)

## Structure

```
DMS/
├── provider.tf              # Provider configuration
├── README.md                # This file
├── modules/
│   ├── dms_endpoints/       # Combined source/target endpoint module
│   ├── dms_replication_instance/   # Replication instance module
│   └── dms_replication_task/       # Replication task module
├── environments/
│   ├── dev/
│   │   ├── main.tf          # Dev environment configuration
│   │   ├── outputs.tf       # Dev outputs
│   │   ├── terraform.tfvars # Dev variables (credentials, IDs)
│   │   └── variables.tf     # Dev variable declarations
│   └── prod/
│       └── (Similar structure for prod)
```

## Usage

### Dev Environment

```bash
cd environments/dev
terraform init
terraform plan
terraform apply
```

### Variables

Each environment uses `terraform.tfvars` to override default values. Key variables:
- `replication_instance_id` - DMS replication instance identifier
- `source_endpoint_id` - Source database endpoint ID
- `target_endpoint_id` - Target S3 endpoint ID
- `replication_task_id` - Task identifier

## Modules

### dms_endpoints
Combined module for managing source (database) and target (S3) endpoints.

**Inputs:**
- source_endpoint_id, source_engine_name, source_username, source_password, source_server_name, source_port, source_database_name
- target_endpoint_id, target_bucket_name, target_iam_role_name
- tags

**Outputs:**
- source_endpoint_arn, target_endpoint_arn, target_iam_role_arn

### dms_replication_instance
Manages the DMS replication instance.

**Inputs:**
- replication_instance_id, replication_instance_class, allocated_storage, engine_version, publicly_accessible, multi_az, tags

**Outputs:**
- replication_instance_arn, replication_instance_id

### dms_replication_task
Manages the DMS replication task.

**Inputs:**
- replication_task_id, replication_instance_arn, source_endpoint_arn, target_endpoint_arn, migration_type, table_mappings, cdc_start_time, tags

**Outputs:**
- replication_task_arn, replication_task_id, status
