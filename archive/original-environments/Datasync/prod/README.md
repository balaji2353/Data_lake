Prod environment now reads sensitive values from AWS Secrets Manager.

Defaults and expectations:

- Datasync variable secret (optional): `datasync/prod/variables` — JSON with keys for `agent_name`, `private_link_endpoint`, `vpc_endpoint_id`, `security_group_arns`, `subnet_arns`.
- RDS credentials (optional): `datasync/prod/rds_credentials` — JSON with `username` and `password`.
- DMS credentials (optional): `datasync/prod/dms_credentials` — JSON with `username` and `password`.

You can override the secret names with variables `rds_secret_name` and `dms_secret_name`.

Example datasync variables secret value:
{
  "agent_name": "Bolton-NPD-DataSync-Agent",
  "private_link_endpoint": "10.89.198.27",
  "vpc_endpoint_id": "vpce-036bea06b4174305c",
  "security_group_arns": ["arn:aws:ec2:ap-south-1:337693406343:security-group/sg-00aa2b559d5862ef9"],
  "subnet_arns": ["arn:aws:ec2:ap-south-1:337693406343:subnet/subnet-01713a7af70f16cb1"]
}
