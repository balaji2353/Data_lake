module "datasync" {
  source = "../../../../Datasync/modules/datasync"

  agent_name = "dev-datasync-agent"
  ip_address = var.ip_address

  tags = {
    CSCLASS          = "Confidential"
    CSQUAL           = "Financial Information"
    COUNTRY          = "IN"
    GROUPCONTACT     = "intaxitplatform@deloitte.com"
    SECONDARYCONTACT = "anahitavarma@deloitte.com"
    FUNCTION         = "Tax"
    PRIMARYCONTACT   = "vveer@deloitte.com"
    CMS              = "IN-ITS"
    ENVIRONMENT      = "Development"
    BILLINGCODE      = "FPTN0002"
    BILLINGCONTACT   = "msirsat@deloitte.com"
    CSTYPE           = "Internal"
    Project          = "Deloitte"
  }
}
