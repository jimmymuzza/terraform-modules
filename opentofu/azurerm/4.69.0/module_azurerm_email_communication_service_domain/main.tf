resource "azurerm_email_communication_service_domain" "email_communication_service_domains" {
  for_each = var.email_communication_service_domains

  domain_management                = each.value.domain_management
  email_service_id                 = each.value.email_service_id
  name                             = each.value.name
  tags                             = each.value.tags
  user_engagement_tracking_enabled = each.value.user_engagement_tracking_enabled
}
