data "aws_secretsmanager_secret_version" "rds" {
  secret_id = var.rds_secret_name
}

data "aws_secretsmanager_secret_version" "dms" {
  secret_id = var.dms_secret_name
}

locals {
  datasync_rds_secrets = length(trimspace(data.aws_secretsmanager_secret_version.rds.secret_string)) > 0 ? jsondecode(data.aws_secretsmanager_secret_version.rds.secret_string) : {}
  datasync_dms_secrets = length(trimspace(data.aws_secretsmanager_secret_version.dms.secret_string)) > 0 ? jsondecode(data.aws_secretsmanager_secret_version.dms.secret_string) : {}
}

module "datasync" {
  source = "../../modules/datasync"

  agent_name            = var.agent_name
  private_link_endpoint = var.private_link_endpoint
  vpc_endpoint_id       = var.vpc_endpoint_id
  security_group_arns   = var.security_group_arns
  subnet_arns           = var.subnet_arns

  tags = {
    CSCLASS          = "Confidential"
    CSQUAL           = "Financial Information"
    COUNTRY          = "IN"
    GROUPCONTACT     = "intaxitplatform@deloitte.com"
    SECONDARYCONTACT = "anahitavarma@deloitte.com"
    FUNCTION         = "Tax"
    PRIMARYCONTACT   = "vveer@deloitte.com"
    CMS              = "IN-ITS"
    ENVIRONMENT      = "Production"
    BILLINGCODE      = "FPTN0002"
    BILLINGCONTACT   = "msirsat@deloitte.com"
    CSTYPE           = "Internal"
    Project          = "Deloitte"
  }

  # Secrets are read here for visibility; the module does not accept them as inputs.
}
