name = "dms_validation_workgroup_for_task_I77UQ7HXIBDLTLOQHMXDRHQ6PQ"
# Example: configuration = { publish_cloudwatch_metrics_enabled = true }
 
# Optional second workgroup (leave commented or null to skip)
#secondary_configuration = { publish_cloudwatch_metrics_enabled = true }
#secondary_tags = { Environment = "dev" }
workgroups = {
	primary = {
		name = "dms_validation_workgroup_for_task_I77UQ7HXIBDLTLOQHMXDRHQ6PQ"
		# configuration = { publish_cloudwatch_metrics_enabled = true }
		tags = { Environment = "dev" }
	}
	secondary = {
		name = "dms_validation_workgroup_secondary"
		description = "Secondary workgroup for additional queries"
		# configuration = { publish_cloudwatch_metrics_enabled = true }
		# tags = { Environment = "dev" }
	}
}
