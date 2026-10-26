resource "aws_odb_cloud_vm_cluster" "odb_cloud_vm_clusters" {
  for_each = var.odb_cloud_vm_clusters

  cpu_core_count                   = each.value.cpu_core_count
  data_storage_size_in_tbs         = each.value.data_storage_size_in_tbs
  db_servers                       = each.value.db_servers
  display_name                     = each.value.display_name
  gi_version                       = each.value.gi_version
  hostname_prefix                  = each.value.hostname_prefix
  ssh_public_keys                  = each.value.ssh_public_keys
  cloud_exadata_infrastructure_arn = each.value.cloud_exadata_infrastructure_arn
  cloud_exadata_infrastructure_id  = each.value.cloud_exadata_infrastructure_id
  cluster_name                     = each.value.cluster_name
  db_node_storage_size_in_gbs      = each.value.db_node_storage_size_in_gbs
  is_local_backup_enabled          = each.value.is_local_backup_enabled
  is_sparse_diskgroup_enabled      = each.value.is_sparse_diskgroup_enabled
  license_model                    = each.value.license_model
  memory_size_in_gbs               = each.value.memory_size_in_gbs
  odb_network_arn                  = each.value.odb_network_arn
  odb_network_id                   = each.value.odb_network_id
  region                           = each.value.region
  scan_listener_port_tcp           = each.value.scan_listener_port_tcp
  tags                             = each.value.tags
  timezone                         = each.value.timezone

  dynamic "data_collection_options" {
    for_each = each.value.data_collection_options != null ? each.value.data_collection_options : []
    content {
      is_diagnostics_events_enabled = data_collection_options.value.is_diagnostics_events_enabled
      is_health_monitoring_enabled  = data_collection_options.value.is_health_monitoring_enabled
      is_incident_logs_enabled      = data_collection_options.value.is_incident_logs_enabled
    }
  }
}
