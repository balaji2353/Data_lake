# RDS

Environment-specific Terraform configurations are under the `environments/` directory:

- `environments/dev/` - development/nonprod configuration
- `environments/prod/` - production configuration

The reusable module lives at `modules/rds` (one level up from repo root).

Usage example (from repo root):

cd RDS/environments/dev
terraform init
terraform plan
