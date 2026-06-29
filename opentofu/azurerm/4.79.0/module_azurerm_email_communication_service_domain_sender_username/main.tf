resource "azurerm_email_communication_service_domain_sender_username" "email_communication_service_domain_sender_usernames" {
  for_each = var.email_communication_service_domain_sender_usernames

  email_service_domain_id = each.value.email_service_domain_id
  name                    = each.value.name
  display_name            = each.value.display_name
}
