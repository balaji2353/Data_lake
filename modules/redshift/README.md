# Redshift Serverless Module

This module manages an AWS Redshift Serverless workgroup.

## Inputs

- `namespace_name` (string) - Redshift Serverless namespace name (required)
- `workgroup_name` (string) - Workgroup name (required)
- `tags` (map(string)) - Tags to apply (optional)
- `security_group_ids` (list(string)) - Optional list of SG IDs for VPC endpoints
- `subnet_ids` (list(string)) - Optional list of subnet IDs for VPC endpoints
- `config_parameters` (list(object)) - Optional list of config parameter objects with `parameter_key` and `parameter_value`
- `price_performance_target` (object) - Optional object with `enabled` (bool) and `level` (number)

## Outputs

- `id` - Workgroup resource ID
- `workgroup_name` - Workgroup name
- `namespace_name` - Namespace name
- `security_group_ids` - Security groups attached (if any)
- `subnet_ids` - Subnets attached (if any)

## Example

module "redshift" {
  source         = "../modules/redshift"
  namespace_name = "taxdatalake-nonprod"
  workgroup_name = "redshift-serverless"
  tags = {
    Environment = "nonprod"
  }
}
