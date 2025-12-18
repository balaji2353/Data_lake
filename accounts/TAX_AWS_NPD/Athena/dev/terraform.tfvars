name = "dms_validation_workgroup_for_task_I77UQ7HXIBDLTLOQHMXDRHQ6PQ"
workgroups = {
  primary = {
    name = "dms_validation_workgroup_for_task_I77UQ7HXIBDLTLOQHMXDRHQ6PQ"
    # configuration = { publish_cloudwatch_metrics_enabled = true }
    tags = { Environment = "dev" }
  }
  secondary = {
    name        = "dms_validation_workgroup_secondary"
    description = "Secondary workgroup for additional queries"
  }
}
