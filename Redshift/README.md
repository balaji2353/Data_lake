# Redshift

Environment-specific Terraform configurations are under the `environments/` directory:

- `environments/dev/` - development/nonprod configuration
- `environments/prod/` - production configuration

The reusable module lives at `modules/redshift` (one level up from repo root).

Usage example (from repo root):

cd Redshift/environments/dev
terraform init
terraform plan
