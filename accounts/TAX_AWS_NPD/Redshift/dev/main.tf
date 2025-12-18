module "redshift" {
  source         = "../../../../Redshift/modules/redshift"
  namespace_name = var.namespace_name
  workgroup_name = var.workgroup_name
  tags           = var.tags
}
