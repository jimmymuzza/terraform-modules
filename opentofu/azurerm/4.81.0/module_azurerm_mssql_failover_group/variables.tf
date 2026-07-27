variable "mssql_failover_groups" {
  description = <<EOT
Map of mssql_failover_groups, attributes below
Required:
    - name
    - server_id
    - partner_server
    - read_write_endpoint_failover_policy
Optional:
    - databases
    - readonly_endpoint_failover_policy_enabled
    - tags
EOT

  type = map(object({
    name                                      = string
    server_id                                 = string
    databases                                 = optional(set(string))
    readonly_endpoint_failover_policy_enabled = optional(bool)
    tags                                      = optional(map(string))
    partner_server                            = list(object({

        }))
    read_write_endpoint_failover_policy       = list(object({
            mode          = string
            grace_minutes = optional(number)
        }))
  }))
}
