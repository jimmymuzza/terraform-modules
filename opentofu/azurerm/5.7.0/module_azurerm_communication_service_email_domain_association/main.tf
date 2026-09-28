resource "azurerm_communication_service_email_domain_association" "communication_service_email_domain_associations" {
  for_each = var.communication_service_email_domain_associations

  communication_service_id = each.value.communication_service_id
  email_service_domain_id  = each.value.email_service_domain_id
}
