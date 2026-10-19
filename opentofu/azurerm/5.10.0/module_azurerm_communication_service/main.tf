resource "azurerm_communication_service" "communication_services" {
  for_each = var.communication_services

  data_location       = each.value.data_location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  tags                = each.value.tags
}
