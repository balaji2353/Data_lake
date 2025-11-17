# StageMaker

This folder contains Terraform configuration for the StageMaker service.

Structure:
- `provider.tf` - provider configuration
- `environments/` - per-environment configs (dev, prod)
- `modules/` - reusable modules for StageMaker resources

Run `terraform init` and `terraform plan` inside an environment folder (for example `environments/dev`).
