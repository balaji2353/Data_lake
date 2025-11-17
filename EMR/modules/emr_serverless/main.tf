resource "aws_emrserverless_application" "app" {
  name             = var.application_name
  release_label    = var.release_label
  type             = var.application_type
  
  maximum_capacity {
    cpu    = var.maximum_capacity_cpu
    memory = var.maximum_capacity_memory
  }

  dynamic "initial_capacity" {
    for_each = var.initial_capacity
    content {
      initial_capacity_type = initial_capacity.value.type
      initial_capacity_config {
        worker_count = initial_capacity.value.worker_count
        worker_configuration {
          cpu    = initial_capacity.value.cpu
          memory = initial_capacity.value.memory
        }
      }
    }
  }

  tags = merge(
    var.tags,
    {
      Name        = var.application_name
      Environment = var.environment
      ManagedBy   = "Terraform"
    }
  )
}
