variable "odb_cloud_vm_clusters" {
  description = <<EOT
Map of odb_cloud_vm_clusters, attributes below
Required:
    - cpu_core_count
    - data_storage_size_in_tbs
    - db_servers
    - display_name
    - gi_version
    - hostname_prefix
    - ssh_public_keys
Optional:
    - cloud_exadata_infrastructure_arn
    - cloud_exadata_infrastructure_id
    - cluster_name
    - db_node_storage_size_in_gbs
    - is_local_backup_enabled
    - is_sparse_diskgroup_enabled
    - license_model
    - memory_size_in_gbs
    - odb_network_arn
    - odb_network_id
    - region
    - scan_listener_port_tcp
    - tags
    - timezone
    - data_collection_options
EOT

  type = map(object({
    cpu_core_count                   = number
    data_storage_size_in_tbs         = number
    db_servers                       = set(string)
    display_name                     = string
    gi_version                       = string
    hostname_prefix                  = string
    ssh_public_keys                  = set(string)
    cloud_exadata_infrastructure_arn = optional(string)
    cloud_exadata_infrastructure_id  = optional(string)
    cluster_name                     = optional(string)
    db_node_storage_size_in_gbs      = optional(number)
    is_local_backup_enabled          = optional(bool)
    is_sparse_diskgroup_enabled      = optional(bool)
    license_model                    = optional(string)
    memory_size_in_gbs               = optional(number)
    odb_network_arn                  = optional(string)
    odb_network_id                   = optional(string)
    region                           = optional(string)
    scan_listener_port_tcp           = optional(number)
    tags                             = optional(map(string))
    timezone                         = optional(string)
    data_collection_options          = optional(list(object({
            is_diagnostics_events_enabled = bool
            is_health_monitoring_enabled  = bool
            is_incident_logs_enabled      = bool
        })))
  }))
}
