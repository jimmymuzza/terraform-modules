variable "odb_cloud_autonomous_vm_clusters" {
  description = <<EOT
Map of odb_cloud_autonomous_vm_clusters, attributes below
Required:
    - autonomous_data_storage_size_in_tbs
    - cpu_core_count_per_node
    - db_servers
    - display_name
    - memory_per_oracle_compute_unit_in_gbs
    - scan_listener_port_non_tls
    - scan_listener_port_tls
    - total_container_databases
Optional:
    - cloud_exadata_infrastructure_arn
    - cloud_exadata_infrastructure_id
    - description
    - is_mtls_enabled_vm_cluster
    - license_model
    - odb_network_arn
    - odb_network_id
    - region
    - tags
    - time_zone
    - maintenance_window
EOT

  type = map(object({
    autonomous_data_storage_size_in_tbs   = number
    cpu_core_count_per_node               = number
    db_servers                            = set(string)
    display_name                          = string
    memory_per_oracle_compute_unit_in_gbs = number
    scan_listener_port_non_tls            = number
    scan_listener_port_tls                = number
    total_container_databases             = number
    cloud_exadata_infrastructure_arn      = optional(string)
    cloud_exadata_infrastructure_id       = optional(string)
    description                           = optional(string)
    is_mtls_enabled_vm_cluster            = optional(bool)
    license_model                         = optional(string)
    odb_network_arn                       = optional(string)
    odb_network_id                        = optional(string)
    region                                = optional(string)
    tags                                  = optional(map(string))
    time_zone                             = optional(string)
    maintenance_window                    = optional(list(object({
            preference         = string
            days_of_week       = optional(set(object({
                name = string
            })))
            hours_of_day       = optional(set(number))
            lead_time_in_weeks = optional(number)
            months             = optional(set(object({
                name = string
            })))
            weeks_of_month     = optional(set(number))
        })))
  }))
}
