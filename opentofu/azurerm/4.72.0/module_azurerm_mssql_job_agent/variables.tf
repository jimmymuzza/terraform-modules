variable "mssql_job_agents" {
  description = <<EOT
Map of mssql_job_agents, attributes below
Required:
    - database_id
    - location
    - name
Optional:
    - sku
    - tags
    - identity
EOT

  type = map(object({
    database_id = string
    location    = string
    name        = string
    sku         = optional(string)
    tags        = optional(map(string))
    identity    = optional(list(object({
            identity_ids = set(string)
            type         = string
        })))
  }))
}
