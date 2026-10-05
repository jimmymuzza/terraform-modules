variable "oracle_cloud_vm_clusters" {
  description = <<EOT
Map of oracle_cloud_vm_clusters, attributes below
Required:
    - cloud_exadata_infrastructure_id
    - cpu_core_count
    - db_servers
    - display_name
    - gi_version
    - hostname
    - license_model
    - location
    - name
    - resource_group_name
    - ssh_public_keys
    - subnet_id
    - virtual_network_id
Optional:
    - backup_subnet_cidr
    - cluster_name
    - data_storage_percentage
    - data_storage_size_in_tbs
    - db_node_storage_size_in_gbs
    - domain
    - local_backup_enabled
    - memory_size_in_gbs
    - scan_listener_port_tcp
    - scan_listener_port_tcp_ssl
    - sparse_diskgroup_enabled
    - system_version
    - tags
    - time_zone
    - zone_id
    - data_collection_options
    - file_system_configuration
EOT

  type = map(object({
    cloud_exadata_infrastructure_id = string
    cpu_core_count                  = number
    db_servers                      = list(string)
    display_name                    = string
    gi_version                      = string
    hostname                        = string
    license_model                   = string
    location                        = string
    name                            = string
    resource_group_name             = string
    ssh_public_keys                 = list(string)
    subnet_id                       = string
    virtual_network_id              = string
    backup_subnet_cidr              = optional(string)
    cluster_name                    = optional(string)
    data_storage_percentage         = optional(number)
    data_storage_size_in_tbs        = optional(number)
    db_node_storage_size_in_gbs     = optional(number)
    domain                          = optional(string)
    local_backup_enabled            = optional(bool)
    memory_size_in_gbs              = optional(number)
    scan_listener_port_tcp          = optional(number)
    scan_listener_port_tcp_ssl      = optional(number)
    sparse_diskgroup_enabled        = optional(bool)
    system_version                  = optional(string)
    tags                            = optional(map(string))
    time_zone                       = optional(string)
    zone_id                         = optional(string)
    data_collection_options         = optional(list(object({
            diagnostics_events_enabled = optional(bool)
            health_monitoring_enabled  = optional(bool)
            incident_logs_enabled      = optional(bool)
        })))
    file_system_configuration       = optional(list(object({
            mount_point = optional(string)
            size_in_gb  = optional(number)
        })))
  }))
}
