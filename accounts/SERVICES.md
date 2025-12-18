# Services Overview

This file lists the service folders under the workspace and gives a short description and next-step commands.

## Environments
- `in-TAX-AWS-PRD/` — Production account folders containing service-specific Terraform configurations.
- `TAX_AWS_NPD/` — Non-production (NPD) account folders (dev, staging) — similar structure.
- `archive/` — Archived environment configs and original environments.

## Services (in `in-TAX-AWS-PRD`)
- Airflow: accounts/in-TAX-AWS-PRD/Airflow
  - Purpose: MWAA (Managed Workflows for Apache Airflow) environment modules and environment roots (dev/prod).
  - Path: accounts/in-TAX-AWS-PRD/Airflow
  - Quick check: `cd accounts/in-TAX-AWS-PRD/Airflow/prod && terraform init && terraform validate`

- Athena: accounts/in-TAX-AWS-PRD/Athena
  - Purpose: Athena queries/setup for environments.
  - Path: accounts/in-TAX-AWS-PRD/Athena

- Datasync: accounts/in-TAX-AWS-PRD/Datasync
  - Purpose: AWS DataSync agents/tasks modules and environment roots.
  - Path: accounts/in-TAX-AWS-PRD/Datasync
  - Quick check: `cd accounts/in-TAX-AWS-PRD/Datasync/prod && terraform init && terraform validate`

- DMS: accounts/in-TAX-AWS-PRD/DMS
  - Purpose: Database Migration Service modules and prod/dev roots.
  - Path: accounts/in-TAX-AWS-PRD/DMS

- EMR: accounts/in-TAX-AWS-PRD/EMR
  - Purpose: EMR Serverless / EMR cluster definitions for environments.
  - Path: accounts/in-TAX-AWS-PRD/EMR
  - Quick check: `cd accounts/in-TAX-AWS-PRD/EMR/prod && terraform init && terraform validate`

- RDS: accounts/in-TAX-AWS-PRD/RDS
  - Purpose: RDS databases and related resources.
  - Path: accounts/in-TAX-AWS-PRD/RDS

- Redshift: accounts/in-TAX-AWS-PRD/Redshift
  - Purpose: Redshift clusters and data warehouse configuration.
  - Path: accounts/in-TAX-AWS-PRD/Redshift

## General guidance
- Workspace-level operations should be executed inside an environment root (for example `.../prod` or `.../dev`).
- For offline validation where secrets are required, either provide placeholder values via `-var` or temporarily comment out secret `data` sources (for testing only).
- If you want I can generate individual READMEs inside each service folder with commands, variables and inputs documented.

If you want per-service README files created now, say which services to generate or reply `all` to create for every service above.
