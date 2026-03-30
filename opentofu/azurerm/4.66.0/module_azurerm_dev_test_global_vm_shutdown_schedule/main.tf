resource "azurerm_dev_test_global_vm_shutdown_schedule" "dev_test_global_vm_shutdown_schedules" {
  for_each = var.dev_test_global_vm_shutdown_schedules

  daily_recurrence_time = each.value.daily_recurrence_time
  location              = each.value.location
  timezone              = each.value.timezone
  virtual_machine_id    = each.value.virtual_machine_id
  enabled               = each.value.enabled
  tags                  = each.value.tags

  dynamic "notification_settings" {
    for_each = each.value.notification_settings != null ? each.value.notification_settings : []
    content {
      enabled         = notification_settings.value.enabled
      email           = notification_settings.value.email
      time_in_minutes = notification_settings.value.time_in_minutes
      webhook_url     = notification_settings.value.webhook_url
    }
  }
}
