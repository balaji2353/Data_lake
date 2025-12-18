module "athena" {
  source = "../../../../Athena/modules/athena"

  workgroups = var.workgroups
}
