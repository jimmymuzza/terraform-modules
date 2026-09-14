resource "azurerm_cost_management_scheduled_action" "cost_management_scheduled_actions" {
  for_each = var.cost_management_scheduled_actions

  display_name         = each.value.display_name
  email_address_sender = each.value.email_address_sender
  email_addresses      = each.value.email_addresses
  email_subject        = each.value.email_subject
  end_date             = each.value.end_date
  frequency            = each.value.frequency
  name                 = each.value.name
  start_date           = each.value.start_date
  view_id              = each.value.view_id
  day_of_month         = each.value.day_of_month
  days_of_week         = each.value.days_of_week
  hour_of_day          = each.value.hour_of_day
  message              = each.value.message
  weeks_of_month       = each.value.weeks_of_month
}
