resource "azurerm_mssql_job_step" "mssql_job_steps" {
  for_each = var.mssql_job_steps

  job_id                            = each.value.job_id
  job_step_index                    = each.value.job_step_index
  job_target_group_id               = each.value.job_target_group_id
  name                              = each.value.name
  sql_script                        = each.value.sql_script
  initial_retry_interval_seconds    = each.value.initial_retry_interval_seconds
  job_credential_id                 = each.value.job_credential_id
  maximum_retry_interval_seconds    = each.value.maximum_retry_interval_seconds
  retry_attempts                    = each.value.retry_attempts
  retry_interval_backoff_multiplier = each.value.retry_interval_backoff_multiplier
  timeout_seconds                   = each.value.timeout_seconds

  dynamic "output_target" {
    for_each = each.value.output_target != null ? each.value.output_target : []
    content {
      mssql_database_id = output_target.value.mssql_database_id
      table_name        = output_target.value.table_name
      job_credential_id = output_target.value.job_credential_id
      schema_name       = output_target.value.schema_name
    }
  }
}
