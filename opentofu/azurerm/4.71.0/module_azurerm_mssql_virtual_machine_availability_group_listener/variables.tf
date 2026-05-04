variable "mssql_virtual_machine_availability_group_listeners" {
  description = <<EOT
Map of mssql_virtual_machine_availability_group_listeners, attributes below
Required:
    - name
    - sql_virtual_machine_group_id
    - replica
Optional:
    - availability_group_name
    - port
    - load_balancer_configuration
    - multi_subnet_ip_configuration
EOT

  type = map(object({
    name                          = string
    sql_virtual_machine_group_id  = string
    availability_group_name       = optional(string)
    port                          = optional(number)
    load_balancer_configuration   = optional(list(object({
            load_balancer_id        = string
            private_ip_address      = string
            probe_port              = number
            sql_virtual_machine_ids = set(string)
            subnet_id               = string
        })))
    multi_subnet_ip_configuration = optional(set(object({
            private_ip_address     = string
            sql_virtual_machine_id = string
            subnet_id              = string
        })))
    replica                       = set(object({
            commit                 = string
            failover_mode          = string
            readable_secondary     = string
            role                   = string
            sql_virtual_machine_id = string
        }))
  }))
}
