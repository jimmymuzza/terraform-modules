resource "aws_fsx_ontap_file_system" "fsx_ontap_file_systems" {
  for_each = var.fsx_ontap_file_systems

  deployment_type                   = each.value.deployment_type
  preferred_subnet_id               = each.value.preferred_subnet_id
  storage_capacity                  = each.value.storage_capacity
  subnet_ids                        = each.value.subnet_ids
  automatic_backup_retention_days   = each.value.automatic_backup_retention_days
  daily_automatic_backup_start_time = each.value.daily_automatic_backup_start_time
  endpoint_ip_address_range         = each.value.endpoint_ip_address_range
  fsx_admin_password                = each.value.fsx_admin_password
  ha_pairs                          = each.value.ha_pairs
  kms_key_id                        = each.value.kms_key_id
  network_type                      = each.value.network_type
  region                            = each.value.region
  route_table_ids                   = each.value.route_table_ids
  security_group_ids                = each.value.security_group_ids
  storage_type                      = each.value.storage_type
  tags                              = each.value.tags
  tags_all                          = each.value.tags_all
  throughput_capacity               = each.value.throughput_capacity
  throughput_capacity_per_ha_pair   = each.value.throughput_capacity_per_ha_pair
  weekly_maintenance_start_time     = each.value.weekly_maintenance_start_time

  dynamic "disk_iops_configuration" {
    for_each = each.value.disk_iops_configuration != null ? each.value.disk_iops_configuration : []
    content {
      iops = disk_iops_configuration.value.iops
      mode = disk_iops_configuration.value.mode
    }
  }
}
