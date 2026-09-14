resource "azurerm_automanage_configuration" "automanage_configurations" {
  for_each = var.automanage_configurations

  location                    = each.value.location
  name                        = each.value.name
  resource_group_name         = each.value.resource_group_name
  automation_account_enabled  = each.value.automation_account_enabled
  boot_diagnostics_enabled    = each.value.boot_diagnostics_enabled
  defender_for_cloud_enabled  = each.value.defender_for_cloud_enabled
  guest_configuration_enabled = each.value.guest_configuration_enabled
  log_analytics_enabled       = each.value.log_analytics_enabled
  status_change_alert_enabled = each.value.status_change_alert_enabled
  tags                        = each.value.tags

  dynamic "antimalware" {
    for_each = each.value.antimalware != null ? each.value.antimalware : []
    content {
      real_time_protection_enabled   = antimalware.value.real_time_protection_enabled
      scheduled_scan_day             = antimalware.value.scheduled_scan_day
      scheduled_scan_enabled         = antimalware.value.scheduled_scan_enabled
      scheduled_scan_time_in_minutes = antimalware.value.scheduled_scan_time_in_minutes
      scheduled_scan_type            = antimalware.value.scheduled_scan_type

      dynamic "exclusions" {
        for_each = antimalware.value.exclusions != null ? antimalware.value.exclusions : []
        content {
          extensions = exclusions.value.extensions
          paths      = exclusions.value.paths
          processes  = exclusions.value.processes
        }
      }
    }
  }

  dynamic "azure_security_baseline" {
    for_each = each.value.azure_security_baseline != null ? each.value.azure_security_baseline : []
    content {
      assignment_type = azure_security_baseline.value.assignment_type
    }
  }

  dynamic "backup" {
    for_each = each.value.backup != null ? each.value.backup : []
    content {
      instant_rp_retention_range_in_days = backup.value.instant_rp_retention_range_in_days
      policy_name                        = backup.value.policy_name
      time_zone                          = backup.value.time_zone

      dynamic "retention_policy" {
        for_each = backup.value.retention_policy != null ? backup.value.retention_policy : []
        content {
          retention_policy_type = retention_policy.value.retention_policy_type

          dynamic "daily_schedule" {
            for_each = retention_policy.value.daily_schedule != null ? retention_policy.value.daily_schedule : []
            content {
              retention_times = daily_schedule.value.retention_times

              dynamic "retention_duration" {
                for_each = daily_schedule.value.retention_duration != null ? daily_schedule.value.retention_duration : []
                content {
                  count         = retention_duration.value.count
                  duration_type = retention_duration.value.duration_type
                }
              }
            }
          }

          dynamic "weekly_schedule" {
            for_each = retention_policy.value.weekly_schedule != null ? retention_policy.value.weekly_schedule : []
            content {
              retention_times = weekly_schedule.value.retention_times

              dynamic "retention_duration" {
                for_each = weekly_schedule.value.retention_duration != null ? weekly_schedule.value.retention_duration : []
                content {
                  count         = retention_duration.value.count
                  duration_type = retention_duration.value.duration_type
                }
              }
            }
          }
        }
      }

      dynamic "schedule_policy" {
        for_each = backup.value.schedule_policy != null ? backup.value.schedule_policy : []
        content {
          schedule_policy_type   = schedule_policy.value.schedule_policy_type
          schedule_run_days      = schedule_policy.value.schedule_run_days
          schedule_run_frequency = schedule_policy.value.schedule_run_frequency
          schedule_run_times     = schedule_policy.value.schedule_run_times
        }
      }
    }
  }
}
