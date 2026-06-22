variable "mssql_job_credentials" {
  description = <<EOT
Map of mssql_job_credentials, attributes below
Required:
    - job_agent_id
    - name
    - username
Optional:
    - password
    - password_wo
    - password_wo_version
EOT

  type = map(object({
    job_agent_id        = string
    name                = string
    username            = string
    password            = optional(string)
    password_wo         = optional(string)
    password_wo_version = optional(number)
  }))
}
