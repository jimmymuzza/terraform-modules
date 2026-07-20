resource "azurerm_automation_schedule" "automation_schedules" {
  for_each = var.automation_schedules

  automation_account_name = each.value.automation_account_name
  frequency               = each.value.frequency
  name                    = each.value.name
  resource_group_name     = each.value.resource_group_name
  description             = each.value.description
  expiry_time             = each.value.expiry_time
  interval                = each.value.interval
  month_days              = each.value.month_days
  start_time              = each.value.start_time
  timezone                = each.value.timezone
  week_days               = each.value.week_days

  dynamic "monthly_occurrence" {
    for_each = each.value.monthly_occurrence != null ? each.value.monthly_occurrence : []
    content {
      day        = monthly_occurrence.value.day
      occurrence = monthly_occurrence.value.occurrence
    }
  }
}
