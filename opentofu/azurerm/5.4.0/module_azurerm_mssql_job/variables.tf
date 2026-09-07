variable "mssql_jobs" {
  description = <<EOT
Map of mssql_jobs, attributes below
Required:
    - job_agent_id
    - name
Optional:
    - description
EOT

  type = map(object({
    job_agent_id = string
    name         = string
    description  = optional(string)
  }))
}
