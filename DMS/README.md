# DMS Terraform Configuration

This directory contains AWS Database Migration Service (DMS) configurations.

## Structure

```
DMS/
├── environments/
│   ├── dev/               # Development environment (local state)
│   └── prod/              # Production environment (remote state)
├── modules/               # Service-specific modules
└── README.md
```

## Backend Configuration
- **Dev**: Local state files
- **Prod**: Remote S3 state (`taxdatatest/terraform-state`)

## Usage

```bash
# Development
cd environments/dev
terraform init
terraform plan

# Production  
cd environments/prod
terraform init
terraform plan
```