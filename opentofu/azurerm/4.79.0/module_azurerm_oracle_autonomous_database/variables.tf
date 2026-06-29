variable "oracle_autonomous_databases" {
  description = <<EOT
Map of oracle_autonomous_databases, attributes below
Required:
    - admin_password
    - auto_scaling_enabled
    - auto_scaling_for_storage_enabled
    - backup_retention_period_in_days
    - character_set
    - compute_count
    - compute_model
    - data_storage_size_in_tbs
    - db_version
    - db_workload
    - display_name
    - license_model
    - location
    - mtls_connection_required
    - name
    - national_character_set
    - resource_group_name
Optional:
    - allowed_ips
    - customer_contacts
    - subnet_id
    - tags
    - virtual_network_id
    - long_term_backup_schedule
EOT

  type = map(object({
    admin_password                   = string
    auto_scaling_enabled             = bool
    auto_scaling_for_storage_enabled = bool
    backup_retention_period_in_days  = number
    character_set                    = string
    compute_count                    = number
    compute_model                    = string
    data_storage_size_in_tbs         = number
    db_version                       = string
    db_workload                      = string
    display_name                     = string
    license_model                    = string
    location                         = string
    mtls_connection_required         = bool
    name                             = string
    national_character_set           = string
    resource_group_name              = string
    allowed_ips                      = optional(set(string))
    customer_contacts                = optional(list(string))
    subnet_id                        = optional(string)
    tags                             = optional(map(string))
    virtual_network_id               = optional(string)
    long_term_backup_schedule        = optional(list(object({
            enabled                  = bool
            repeat_cadence           = string
            retention_period_in_days = number
            time_of_backup           = string
        })))
  }))
}
