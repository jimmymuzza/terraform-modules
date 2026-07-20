resource "aws_fsx_windows_file_system" "fsx_windows_file_systems" {
  for_each = var.fsx_windows_file_systems

  subnet_ids                        = each.value.subnet_ids
  throughput_capacity               = each.value.throughput_capacity
  active_directory_id               = each.value.active_directory_id
  aliases                           = each.value.aliases
  automatic_backup_retention_days   = each.value.automatic_backup_retention_days
  backup_id                         = each.value.backup_id
  copy_tags_to_backups              = each.value.copy_tags_to_backups
  daily_automatic_backup_start_time = each.value.daily_automatic_backup_start_time
  deployment_type                   = each.value.deployment_type
  final_backup_tags                 = each.value.final_backup_tags
  kms_key_id                        = each.value.kms_key_id
  preferred_subnet_id               = each.value.preferred_subnet_id
  region                            = each.value.region
  security_group_ids                = each.value.security_group_ids
  skip_final_backup                 = each.value.skip_final_backup
  storage_capacity                  = each.value.storage_capacity
  storage_type                      = each.value.storage_type
  tags                              = each.value.tags
  tags_all                          = each.value.tags_all
  weekly_maintenance_start_time     = each.value.weekly_maintenance_start_time

  dynamic "audit_log_configuration" {
    for_each = each.value.audit_log_configuration != null ? each.value.audit_log_configuration : []
    content {
      audit_log_destination             = audit_log_configuration.value.audit_log_destination
      file_access_audit_log_level       = audit_log_configuration.value.file_access_audit_log_level
      file_share_access_audit_log_level = audit_log_configuration.value.file_share_access_audit_log_level
    }
  }

  dynamic "disk_iops_configuration" {
    for_each = each.value.disk_iops_configuration != null ? each.value.disk_iops_configuration : []
    content {
      iops = disk_iops_configuration.value.iops
      mode = disk_iops_configuration.value.mode
    }
  }

  dynamic "self_managed_active_directory" {
    for_each = each.value.self_managed_active_directory != null ? each.value.self_managed_active_directory : []
    content {
      dns_ips                                = self_managed_active_directory.value.dns_ips
      domain_name                            = self_managed_active_directory.value.domain_name
      domain_join_service_account_secret     = self_managed_active_directory.value.domain_join_service_account_secret
      file_system_administrators_group       = self_managed_active_directory.value.file_system_administrators_group
      organizational_unit_distinguished_name = self_managed_active_directory.value.organizational_unit_distinguished_name
      password                               = self_managed_active_directory.value.password
      password_wo                            = self_managed_active_directory.value.password_wo
      password_wo_version                    = self_managed_active_directory.value.password_wo_version
      username                               = self_managed_active_directory.value.username
    }
  }
}
