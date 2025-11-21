# Terraform Multi-Environment Structure

## Structure
```
terraform/
├── modules/                # Reusable modules
│   ├── dms/
│   ├── mwaa/
│   └── ...
├── dev-airflow/           # Dev Airflow (local state)
├── dev-dms/               # Dev DMS (local state)
├── dev-[service]/         # Other dev services
├── prod-airflow/          # Prod Airflow (remote state)
├── prod-dms/              # Prod DMS (remote state)
└── prod-[service]/        # Other prod services
```

## Backend Configuration
- **Dev environments**: Use local state files
- **Prod environments**: Use remote S3 state (`prod-terraform-state`)

## Usage
Navigate to the specific environment directory:
```bash
cd dev-dms
terraform init
terraform plan

cd prod-dms
terraform init
terraform plan
```