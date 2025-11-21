# Terraform Multi-Environment Structure

## Structure
```
terraform/
├── modules/                # Reusable modules
│   ├── dms/
│   ├── mwaa/
│   └── ...
├── Airflow/
│   ├── environments/
│   │   ├── dev/           # Dev (local state)
│   │   └── prod/          # Prod (remote state)
│   └── modules/
├── DMS/
│   ├── environments/
│   │   ├── dev/           # Dev (local state)
│   │   └── prod/          # Prod (remote state)
│   └── modules/
└── [Other Services]/       # Similar structure
```

## Backend Configuration
- **Dev environments**: Use local state files
- **Prod environments**: Use remote S3 state (`taxdatatest/terraform-state`)

## Usage
Navigate to the specific service and environment:
```bash
cd DMS/environments/dev
terraform init
terraform plan

cd DMS/environments/prod
terraform init
terraform plan
```