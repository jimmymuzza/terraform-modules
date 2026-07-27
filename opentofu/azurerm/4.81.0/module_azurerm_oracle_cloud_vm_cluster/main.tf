resource "azurerm_oracle_cloud_vm_cluster" "oracle_cloud_vm_clusters" {
  for_each = var.oracle_cloud_vm_clusters

  cloud_exadata_infrastructure_id = each.value.cloud_exadata_infrastructure_id
  cpu_core_count                  = each.value.cpu_core_count
  db_servers                      = each.value.db_servers
  display_name                    = each.value.display_name
  gi_version                      = each.value.gi_version
  hostname                        = each.value.hostname
  license_model                   = each.value.license_model
  location                        = each.value.location
  name                            = each.value.name
  resource_group_name             = each.value.resource_group_name
  ssh_public_keys                 = each.value.ssh_public_keys
  subnet_id                       = each.value.subnet_id
  virtual_network_id              = each.value.virtual_network_id
  backup_subnet_cidr              = each.value.backup_subnet_cidr
  cluster_name                    = each.value.cluster_name
  data_storage_percentage         = each.value.data_storage_percentage
  data_storage_size_in_tbs        = each.value.data_storage_size_in_tbs
  db_node_storage_size_in_gbs     = each.value.db_node_storage_size_in_gbs
  domain                          = each.value.domain
  local_backup_enabled            = each.value.local_backup_enabled
  memory_size_in_gbs              = each.value.memory_size_in_gbs
  scan_listener_port_tcp          = each.value.scan_listener_port_tcp
  scan_listener_port_tcp_ssl      = each.value.scan_listener_port_tcp_ssl
  sparse_diskgroup_enabled        = each.value.sparse_diskgroup_enabled
  system_version                  = each.value.system_version
  tags                            = each.value.tags
  time_zone                       = each.value.time_zone
  zone_id                         = each.value.zone_id

  dynamic "data_collection_options" {
    for_each = each.value.data_collection_options != null ? each.value.data_collection_options : []
    content {
      diagnostics_events_enabled = data_collection_options.value.diagnostics_events_enabled
      health_monitoring_enabled  = data_collection_options.value.health_monitoring_enabled
      incident_logs_enabled      = data_collection_options.value.incident_logs_enabled
    }
  }

  dynamic "file_system_configuration" {
    for_each = each.value.file_system_configuration != null ? each.value.file_system_configuration : []
    content {
      mount_point = file_system_configuration.value.mount_point
      size_in_gb  = file_system_configuration.value.size_in_gb
    }
  }
}
