variable "mssql_managed_instance_failover_groups" {
  description = <<EOT
Map of mssql_managed_instance_failover_groups, attributes below
Required:
    - location
    - managed_instance_id
    - name
    - partner_managed_instance_id
    - read_write_endpoint_failover_policy
Optional:
    - readonly_endpoint_failover_policy_enabled
    - secondary_type
EOT

  type = map(object({
    location                                  = string
    managed_instance_id                       = string
    name                                      = string
    partner_managed_instance_id               = string
    readonly_endpoint_failover_policy_enabled = optional(bool)
    secondary_type                            = optional(string)
    read_write_endpoint_failover_policy       = list(object({
            mode          = string
            grace_minutes = optional(number)
        }))
  }))
}
