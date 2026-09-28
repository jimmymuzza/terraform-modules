resource "aws_odb_cloud_autonomous_vm_cluster" "odb_cloud_autonomous_vm_clusters" {
  for_each = var.odb_cloud_autonomous_vm_clusters

  autonomous_data_storage_size_in_tbs   = each.value.autonomous_data_storage_size_in_tbs
  cpu_core_count_per_node               = each.value.cpu_core_count_per_node
  db_servers                            = each.value.db_servers
  display_name                          = each.value.display_name
  memory_per_oracle_compute_unit_in_gbs = each.value.memory_per_oracle_compute_unit_in_gbs
  scan_listener_port_non_tls            = each.value.scan_listener_port_non_tls
  scan_listener_port_tls                = each.value.scan_listener_port_tls
  total_container_databases             = each.value.total_container_databases
  cloud_exadata_infrastructure_arn      = each.value.cloud_exadata_infrastructure_arn
  cloud_exadata_infrastructure_id       = each.value.cloud_exadata_infrastructure_id
  description                           = each.value.description
  is_mtls_enabled_vm_cluster            = each.value.is_mtls_enabled_vm_cluster
  license_model                         = each.value.license_model
  odb_network_arn                       = each.value.odb_network_arn
  odb_network_id                        = each.value.odb_network_id
  region                                = each.value.region
  tags                                  = each.value.tags
  time_zone                             = each.value.time_zone

  dynamic "maintenance_window" {
    for_each = each.value.maintenance_window != null ? each.value.maintenance_window : []
    content {
      preference         = maintenance_window.value.preference
      days_of_week       = maintenance_window.value.days_of_week
      hours_of_day       = maintenance_window.value.hours_of_day
      lead_time_in_weeks = maintenance_window.value.lead_time_in_weeks
      months             = maintenance_window.value.months
      weeks_of_month     = maintenance_window.value.weeks_of_month
    }
  }
}
