# Athena Workgroup Module

This module creates an AWS Athena workgroup.

Inputs
- `name` (string) - workgroup name (required)
- `description` (string) - optional description
- `configuration` (map(any)) - optional configuration map; supported keys used by the module: `enforce_workgroup_configuration`, `publish_cloudwatch_metrics_enabled`, `requester_pays_enabled`, `bytes_scanned_cutoff_per_query`
- `tags` (map(string)) - tags

Outputs
- `name` - created workgroup name
- `arn` - workgroup ARN
- `state` - workgroup state

Example
```
module "athena_wg" {
  source = "../../modules/athena"
  name   = "my-workgroup"
  tags = { Environment = "dev" }
}
```
