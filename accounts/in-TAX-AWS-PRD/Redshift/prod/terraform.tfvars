# Move plaintext values to Secrets Manager for security.
# Example secret JSON: { "namespace_name": "taxdata-redshift-namespace-prod", "workgroup_name": "taxdata-redshift-wg-prod" }
# Provide the secret name below (or leave null to use `namespace_name`/`workgroup_name` variables)
secrets_manager_secret_name = null

# Restored plaintext placeholders (override or replace with Secrets Manager name)
namespace_name = "taxdata-redshift-namespace-prod"
workgroup_name = "taxdata-redshift-wg-prod"

# Optional overrides
tags = {
	Environment = "prod"
	Project     = "Deloitte"
}
