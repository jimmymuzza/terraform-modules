resource "azurerm_email_communication_service" "email_communication_services" {
  for_each = var.email_communication_services

  data_location       = each.value.data_location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  tags                = each.value.tags
}
