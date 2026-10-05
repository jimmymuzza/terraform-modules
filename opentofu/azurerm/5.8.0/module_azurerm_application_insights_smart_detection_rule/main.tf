resource "azurerm_application_insights_smart_detection_rule" "application_insights_smart_detection_rules" {
  for_each = var.application_insights_smart_detection_rules

  application_insights_id            = each.value.application_insights_id
  name                               = each.value.name
  additional_email_recipients        = each.value.additional_email_recipients
  enabled                            = each.value.enabled
  send_emails_to_subscription_owners = each.value.send_emails_to_subscription_owners
}
