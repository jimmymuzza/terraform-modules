variable "mssql_job_target_groups" {
  description = <<EOT
Map of mssql_job_target_groups, attributes below
Required:
    - job_agent_id
    - name
Optional:
    - job_target
EOT

  type = map(object({
    job_agent_id = string
    name         = string
    job_target   = optional(set(object({
            server_name       = string
            database_name     = optional(string)
            elastic_pool_name = optional(string)
            job_credential_id = optional(string)
            membership_type   = optional(string)
        })))
  }))
}
