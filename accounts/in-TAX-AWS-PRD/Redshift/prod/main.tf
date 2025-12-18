data "aws_secretsmanager_secret_version" "redshift" {
  count     = var.secrets_manager_secret_name != null ? 1 : 0
  secret_id = var.secrets_manager_secret_name
}

locals {
  redshift_secrets = var.secrets_manager_secret_name != null ? jsondecode(data.aws_secretsmanager_secret_version.redshift[0].secret_string) : {}
}

module "redshift" {
  source         = "../modules/redshift"
  namespace_name = lookup(local.redshift_secrets, "namespace_name", var.namespace_name)
  workgroup_name = lookup(local.redshift_secrets, "workgroup_name", var.workgroup_name)
  tags           = var.tags
}
