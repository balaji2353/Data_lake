module "redshift" {
  source         = "../../../modules/redshift"
  namespace_name = "taxdatalake-prod"
  workgroup_name = "redshift-serverless"
  tags           = {}
}
