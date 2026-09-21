variable "mssql_job_steps" {
  description = <<EOT
Map of mssql_job_steps, attributes below
Required:
    - job_id
    - job_step_index
    - job_target_group_id
    - name
    - sql_script
Optional:
    - initial_retry_interval_seconds
    - job_credential_id
    - maximum_retry_interval_seconds
    - retry_attempts
    - retry_interval_backoff_multiplier
    - timeout_seconds
    - output_target
EOT

  type = map(object({
    job_id                            = string
    job_step_index                    = number
    job_target_group_id               = string
    name                              = string
    sql_script                        = string
    initial_retry_interval_seconds    = optional(number)
    job_credential_id                 = optional(string)
    maximum_retry_interval_seconds    = optional(number)
    retry_attempts                    = optional(number)
    retry_interval_backoff_multiplier = optional(number)
    timeout_seconds                   = optional(number)
    output_target                     = optional(list(object({
            mssql_database_id = string
            table_name        = string
            job_credential_id = optional(string)
            schema_name       = optional(string)
        })))
  }))
}
