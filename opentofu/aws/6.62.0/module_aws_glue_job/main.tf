resource "aws_glue_job" "glue_jobs" {
  for_each = var.glue_jobs

  name                      = each.value.name
  role_arn                  = each.value.role_arn
  connections               = each.value.connections
  default_arguments         = each.value.default_arguments
  description               = each.value.description
  execution_class           = each.value.execution_class
  glue_version              = each.value.glue_version
  job_mode                  = each.value.job_mode
  job_run_queuing_enabled   = each.value.job_run_queuing_enabled
  maintenance_window        = each.value.maintenance_window
  max_capacity              = each.value.max_capacity
  max_retries               = each.value.max_retries
  non_overridable_arguments = each.value.non_overridable_arguments
  number_of_workers         = each.value.number_of_workers
  region                    = each.value.region
  security_configuration    = each.value.security_configuration
  tags                      = each.value.tags
  tags_all                  = each.value.tags_all
  timeout                   = each.value.timeout
  worker_type               = each.value.worker_type

  dynamic "command" {
    for_each = each.value.command != null ? each.value.command : []
    content {
      script_location = command.value.script_location
      name            = command.value.name
      python_version  = command.value.python_version
      runtime         = command.value.runtime
    }
  }

  dynamic "execution_property" {
    for_each = each.value.execution_property != null ? each.value.execution_property : []
    content {
      max_concurrent_runs = execution_property.value.max_concurrent_runs
    }
  }

  dynamic "notification_property" {
    for_each = each.value.notification_property != null ? each.value.notification_property : []
    content {
      notify_delay_after = notification_property.value.notify_delay_after
    }
  }

  dynamic "source_control_details" {
    for_each = each.value.source_control_details != null ? each.value.source_control_details : []
    content {
      auth_strategy  = source_control_details.value.auth_strategy
      auth_token     = source_control_details.value.auth_token
      branch         = source_control_details.value.branch
      folder         = source_control_details.value.folder
      last_commit_id = source_control_details.value.last_commit_id
      owner          = source_control_details.value.owner
      provider       = source_control_details.value.provider
      repository     = source_control_details.value.repository
    }
  }
}
