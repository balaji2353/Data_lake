module "redshift" {
  source         = "../../../modules/redshift"
  namespace_name = "taxdatalake-nonprod"
  workgroup_name = "redshift-serverless"
  tags           = {}
}
