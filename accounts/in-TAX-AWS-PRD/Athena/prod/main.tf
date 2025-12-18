module "athena" {
  source = "../modules/athena"

  workgroups = var.workgroups
}
