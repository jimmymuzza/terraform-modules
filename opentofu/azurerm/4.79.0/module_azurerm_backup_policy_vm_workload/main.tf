resource "azurerm_backup_policy_vm_workload" "backup_policy_vm_workloads" {
  for_each = var.backup_policy_vm_workloads

  name                = each.value.name
  recovery_vault_name = each.value.recovery_vault_name
  resource_group_name = each.value.resource_group_name
  workload_type       = each.value.workload_type

  dynamic "protection_policy" {
    for_each = each.value.protection_policy != null ? each.value.protection_policy : []
    content {
      policy_type = protection_policy.value.policy_type

      dynamic "backup" {
        for_each = protection_policy.value.backup != null ? protection_policy.value.backup : []
        content {
          frequency            = backup.value.frequency
          frequency_in_minutes = backup.value.frequency_in_minutes
          time                 = backup.value.time
          weekdays             = backup.value.weekdays
        }
      }

      dynamic "retention_daily" {
        for_each = protection_policy.value.retention_daily != null ? protection_policy.value.retention_daily : []
        content {
          count = retention_daily.value.count
        }
      }

      dynamic "retention_monthly" {
        for_each = protection_policy.value.retention_monthly != null ? protection_policy.value.retention_monthly : []
        content {
          count       = retention_monthly.value.count
          format_type = retention_monthly.value.format_type
          monthdays   = retention_monthly.value.monthdays
          weekdays    = retention_monthly.value.weekdays
          weeks       = retention_monthly.value.weeks
        }
      }

      dynamic "retention_weekly" {
        for_each = protection_policy.value.retention_weekly != null ? protection_policy.value.retention_weekly : []
        content {
          count    = retention_weekly.value.count
          weekdays = retention_weekly.value.weekdays
        }
      }

      dynamic "retention_yearly" {
        for_each = protection_policy.value.retention_yearly != null ? protection_policy.value.retention_yearly : []
        content {
          count       = retention_yearly.value.count
          format_type = retention_yearly.value.format_type
          months      = retention_yearly.value.months
          monthdays   = retention_yearly.value.monthdays
          weekdays    = retention_yearly.value.weekdays
          weeks       = retention_yearly.value.weeks
        }
      }

      dynamic "simple_retention" {
        for_each = protection_policy.value.simple_retention != null ? protection_policy.value.simple_retention : []
        content {
          count = simple_retention.value.count
        }
      }
    }
  }

  dynamic "settings" {
    for_each = each.value.settings != null ? each.value.settings : []
    content {
      time_zone           = settings.value.time_zone
      compression_enabled = settings.value.compression_enabled
    }
  }
}
