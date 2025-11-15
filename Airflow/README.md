# Terraform MWAA Multi-Environment Structure

## Folder Structure

```
terraform/
├── environments/
│   ├── prod/
│   │   ├── main.tf              # Production environment config
│   │   └── outputs.tf           # Production outputs
│   ├── staging/
│   │   ├── main.tf              # Staging environment config
│   │   └── outputs.tf           # Staging outputs
│   └── dev/
│       ├── main.tf              # Development environment config
│       └── outputs.tf           # Development outputs
├── modules/
│   └── mwaa/
│       ├── main.tf              # MWAA resource definition
│       ├── variables.tf          # Input variables
│       └── outputs.tf           # Module outputs
├── provider.tf                   # Provider configuration
├── terraform.tfvars             # Default variables (if using root)
└── README.md                    # This file
```

## How to Use

### Deploy to Production
```powershell
cd c:\terraform\environments\prod
terraform init
terraform plan
terraform apply
```

### Deploy to Staging
```powershell
cd c:\terraform\environments\staging
terraform init
terraform plan
terraform apply
```

### Deploy to Development
```powershell
cd c:\terraform\environments\dev
terraform init
terraform plan
terraform apply
```

## Environment Differences

| Aspect | Dev | Staging | Prod |
|--------|-----|---------|------|
| Environment Class | mw1.small | mw1.small | mw1.medium |
| Max Workers | 2 | 5 | 10 |
| Min Workers | 1 | 1 | 1 |
| Schedulers | 1 | 1 | 2 |
| Webservers | 1 | 1 | 2 |
| Access Mode | PRIVATE_ONLY | PRIVATE_ONLY | PRIVATE_ONLY |
| Maintenance Window | MON:02:00 | MON:02:30 | MON:19:30 |

## Customization

For each environment:
1. Navigate to the environment directory: `cd environments/{env-name}`
2. Edit `main.tf` to customize variables:
   - Change `airflow_environment_name` for different names per environment
   - Update AWS resource IDs (subnet_ids, security_group_ids, etc.)
   - Adjust configuration parameters (max_workers, environment_class, etc.)
   - Update tags as needed

## Module Usage

The `modules/mwaa` module is reusable across all environments. To add a new environment:

1. Create a new folder: `mkdir environments/new-env`
2. Copy `main.tf` and `outputs.tf` from an existing environment
3. Update the module variables for the new environment
4. Run terraform init and apply

## Important Notes

- **AWS Credentials**: Ensure AWS CLI is configured with proper credentials before running terraform
- **Terraform State**: Each environment maintains its own state file
- **Network Resources**: Update security group IDs and subnet IDs for each environment
- **IAM Roles**: Update execution role ARNs specific to each environment
- **S3 Buckets**: Use environment-specific S3 bucket names/ARNs

## Troubleshooting

If you get "resource doesn't exist" errors:
1. Verify AWS resource IDs (subnets, security groups, IAM roles) exist in the target environment
2. Check your AWS credentials are pointing to the correct account
3. Ensure region is set correctly in provider.tf

## Next Steps

1. Update AWS resource IDs for each environment (subnets, security groups, roles)
2. Test with `terraform plan` before applying
3. Use `terraform apply` to deploy
4. Monitor outputs for webserver URLs and environment status
