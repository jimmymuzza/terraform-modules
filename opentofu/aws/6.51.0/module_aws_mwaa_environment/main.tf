resource "aws_mwaa_environment" "mwaa_environments" {
  for_each = var.mwaa_environments

  dag_s3_path                      = each.value.dag_s3_path
  execution_role_arn               = each.value.execution_role_arn
  name                             = each.value.name
  source_bucket_arn                = each.value.source_bucket_arn
  airflow_configuration_options    = each.value.airflow_configuration_options
  airflow_version                  = each.value.airflow_version
  endpoint_management              = each.value.endpoint_management
  environment_class                = each.value.environment_class
  kms_key                          = each.value.kms_key
  max_webservers                   = each.value.max_webservers
  max_workers                      = each.value.max_workers
  min_webservers                   = each.value.min_webservers
  min_workers                      = each.value.min_workers
  plugins_s3_object_version        = each.value.plugins_s3_object_version
  plugins_s3_path                  = each.value.plugins_s3_path
  region                           = each.value.region
  requirements_s3_object_version   = each.value.requirements_s3_object_version
  requirements_s3_path             = each.value.requirements_s3_path
  schedulers                       = each.value.schedulers
  startup_script_s3_object_version = each.value.startup_script_s3_object_version
  startup_script_s3_path           = each.value.startup_script_s3_path
  tags                             = each.value.tags
  tags_all                         = each.value.tags_all
  webserver_access_mode            = each.value.webserver_access_mode
  weekly_maintenance_window_start  = each.value.weekly_maintenance_window_start
  worker_replacement_strategy      = each.value.worker_replacement_strategy

  dynamic "logging_configuration" {
    for_each = each.value.logging_configuration != null ? each.value.logging_configuration : []
    content {

      dynamic "dag_processing_logs" {
        for_each = logging_configuration.value.dag_processing_logs != null ? logging_configuration.value.dag_processing_logs : []
        content {
          enabled   = dag_processing_logs.value.enabled
          log_level = dag_processing_logs.value.log_level
        }
      }

      dynamic "scheduler_logs" {
        for_each = logging_configuration.value.scheduler_logs != null ? logging_configuration.value.scheduler_logs : []
        content {
          enabled   = scheduler_logs.value.enabled
          log_level = scheduler_logs.value.log_level
        }
      }

      dynamic "task_logs" {
        for_each = logging_configuration.value.task_logs != null ? logging_configuration.value.task_logs : []
        content {
          enabled   = task_logs.value.enabled
          log_level = task_logs.value.log_level
        }
      }

      dynamic "webserver_logs" {
        for_each = logging_configuration.value.webserver_logs != null ? logging_configuration.value.webserver_logs : []
        content {
          enabled   = webserver_logs.value.enabled
          log_level = webserver_logs.value.log_level
        }
      }

      dynamic "worker_logs" {
        for_each = logging_configuration.value.worker_logs != null ? logging_configuration.value.worker_logs : []
        content {
          enabled   = worker_logs.value.enabled
          log_level = worker_logs.value.log_level
        }
      }
    }
  }

  dynamic "network_configuration" {
    for_each = each.value.network_configuration != null ? each.value.network_configuration : []
    content {
      security_group_ids = network_configuration.value.security_group_ids
      subnet_ids         = network_configuration.value.subnet_ids
    }
  }
}
