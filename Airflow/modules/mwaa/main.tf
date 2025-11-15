resource "aws_mwaa_environment" "airflow" {
  # Required arguments
  dag_s3_path            = var.dag_s3_path
  execution_role_arn     = var.execution_role_arn
  name                   = var.airflow_environment_name
  source_bucket_arn      = var.source_bucket_arn

  # Configuration
  airflow_version                = var.airflow_version
  environment_class              = var.environment_class
  max_workers                    = var.max_workers
  min_workers                    = var.min_workers
  schedulers                     = var.schedulers
  max_webservers                 = var.max_webservers
  min_webservers                 = var.min_webservers
  weekly_maintenance_window_start = var.weekly_maintenance_window_start
  webserver_access_mode          = var.webserver_access_mode
  worker_replacement_strategy    = var.worker_replacement_strategy
  
  logging_configuration {
    dag_processing_logs {
      enabled   = true
      log_level = "INFO"
    }
    scheduler_logs {
      enabled   = true
      log_level = "INFO"
    }
    task_logs {
      enabled   = true
      log_level = "INFO"
    }
    webserver_logs {
      enabled   = true
      log_level = "INFO"
    }
    worker_logs {
      enabled   = true
      log_level = "INFO"
    }
  }

  network_configuration {
    security_group_ids = var.security_group_ids
    subnet_ids         = var.subnet_ids
  }

  tags = merge(
    var.tags,
    {
      Name      = var.airflow_environment_name
      ManagedBy = "Terraform"
    }
  )

  lifecycle {
    ignore_changes = [tags_all]
  }
}
