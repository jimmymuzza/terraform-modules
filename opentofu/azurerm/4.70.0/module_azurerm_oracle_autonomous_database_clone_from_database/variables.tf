variable "oracle_autonomous_database_clone_from_databases" {
  description = <<EOT
Map of oracle_autonomous_database_clone_from_databases, attributes below
Required:
    - admin_password
    - auto_scaling_enabled
    - auto_scaling_for_storage_enabled
    - backup_retention_period_in_days
    - character_set
    - clone_type
    - compute_count
    - compute_model
    - data_storage_size_in_tb
    - database_version
    - database_workload
    - display_name
    - license_model
    - location
    - mtls_connection_required
    - name
    - national_character_set
    - resource_group_name
    - source_autonomous_database_id
Optional:
    - allowed_ip_addresses
    - customer_contacts
    - refreshable_model
    - subnet_id
    - tags
    - virtual_network_id
EOT

  type = map(object({
    admin_password                   = string
    auto_scaling_enabled             = bool
    auto_scaling_for_storage_enabled = bool
    backup_retention_period_in_days  = number
    character_set                    = string
    clone_type                       = string
    compute_count                    = number
    compute_model                    = string
    data_storage_size_in_tb          = number
    database_version                 = string
    database_workload                = string
    display_name                     = string
    license_model                    = string
    location                         = string
    mtls_connection_required         = bool
    name                             = string
    national_character_set           = string
    resource_group_name              = string
    source_autonomous_database_id    = string
    allowed_ip_addresses             = optional(set(string))
    customer_contacts                = optional(list(string))
    refreshable_model                = optional(string)
    subnet_id                        = optional(string)
    tags                             = optional(map(string))
    virtual_network_id               = optional(string)
  }))
}
