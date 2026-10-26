variable "fsx_ontap_file_systems" {
  description = <<EOT
Map of fsx_ontap_file_systems, attributes below
Required:
    - deployment_type
    - preferred_subnet_id
    - storage_capacity
    - subnet_ids
Optional:
    - automatic_backup_retention_days
    - daily_automatic_backup_start_time
    - endpoint_ip_address_range
    - fsx_admin_password
    - ha_pairs
    - kms_key_id
    - network_type
    - region
    - route_table_ids
    - security_group_ids
    - storage_type
    - tags
    - tags_all
    - throughput_capacity
    - throughput_capacity_per_ha_pair
    - weekly_maintenance_start_time
    - disk_iops_configuration
EOT

  type = map(object({
    deployment_type                   = string
    preferred_subnet_id               = string
    storage_capacity                  = number
    subnet_ids                        = list(string)
    automatic_backup_retention_days   = optional(number)
    daily_automatic_backup_start_time = optional(string)
    endpoint_ip_address_range         = optional(string)
    fsx_admin_password                = optional(string)
    ha_pairs                          = optional(number)
    kms_key_id                        = optional(string)
    network_type                      = optional(string)
    region                            = optional(string)
    route_table_ids                   = optional(set(string))
    security_group_ids                = optional(set(string))
    storage_type                      = optional(string)
    tags                              = optional(map(string))
    tags_all                          = optional(map(string))
    throughput_capacity               = optional(number)
    throughput_capacity_per_ha_pair   = optional(number)
    weekly_maintenance_start_time     = optional(string)
    disk_iops_configuration           = optional(list(object({
            iops = optional(number)
            mode = optional(string)
        })))
  }))
}
