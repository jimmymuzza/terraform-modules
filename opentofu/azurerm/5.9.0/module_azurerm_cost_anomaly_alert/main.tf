resource "azurerm_cost_anomaly_alert" "cost_anomaly_alerts" {
  for_each = var.cost_anomaly_alerts

  display_name       = each.value.display_name
  email_addresses    = each.value.email_addresses
  email_subject      = each.value.email_subject
  name               = each.value.name
  message            = each.value.message
  notification_email = each.value.notification_email
  subscription_id    = each.value.subscription_id
}
