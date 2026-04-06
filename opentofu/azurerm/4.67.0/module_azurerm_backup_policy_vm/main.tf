resource "azurerm_backup_policy_vm" "backup_policy_vms" {
  for_each = var.backup_policy_vms

  name                           = each.value.name
  recovery_vault_name            = each.value.recovery_vault_name
  resource_group_name            = each.value.resource_group_name
  instant_restore_retention_days = each.value.instant_restore_retention_days
  policy_type                    = each.value.policy_type
  timezone                       = each.value.timezone

  dynamic "backup" {
    for_each = each.value.backup != null ? each.value.backup : []
    content {
      frequency     = backup.value.frequency
      time          = backup.value.time
      hour_duration = backup.value.hour_duration
      hour_interval = backup.value.hour_interval
      weekdays      = backup.value.weekdays
    }
  }

  dynamic "instant_restore_resource_group" {
    for_each = each.value.instant_restore_resource_group != null ? each.value.instant_restore_resource_group : []
    content {
      prefix = instant_restore_resource_group.value.prefix
      suffix = instant_restore_resource_group.value.suffix
    }
  }

  dynamic "retention_daily" {
    for_each = each.value.retention_daily != null ? each.value.retention_daily : []
    content {
      count = retention_daily.value.count
    }
  }

  dynamic "retention_monthly" {
    for_each = each.value.retention_monthly != null ? each.value.retention_monthly : []
    content {
      count             = retention_monthly.value.count
      days              = retention_monthly.value.days
      include_last_days = retention_monthly.value.include_last_days
      weekdays          = retention_monthly.value.weekdays
      weeks             = retention_monthly.value.weeks
    }
  }

  dynamic "retention_weekly" {
    for_each = each.value.retention_weekly != null ? each.value.retention_weekly : []
    content {
      count    = retention_weekly.value.count
      weekdays = retention_weekly.value.weekdays
    }
  }

  dynamic "retention_yearly" {
    for_each = each.value.retention_yearly != null ? each.value.retention_yearly : []
    content {
      count             = retention_yearly.value.count
      months            = retention_yearly.value.months
      days              = retention_yearly.value.days
      include_last_days = retention_yearly.value.include_last_days
      weekdays          = retention_yearly.value.weekdays
      weeks             = retention_yearly.value.weeks
    }
  }

  dynamic "tiering_policy" {
    for_each = each.value.tiering_policy != null ? each.value.tiering_policy : []
    content {

      dynamic "archived_restore_point" {
        for_each = tiering_policy.value.archived_restore_point != null ? tiering_policy.value.archived_restore_point : []
        content {
          mode          = archived_restore_point.value.mode
          duration      = archived_restore_point.value.duration
          duration_type = archived_restore_point.value.duration_type
        }
      }
    }
  }
}
