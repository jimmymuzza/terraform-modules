resource "azurerm_eventgrid_partner_registration" "eventgrid_partner_registrations" {
  for_each = var.eventgrid_partner_registrations

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  tags                = each.value.tags
}
