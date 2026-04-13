resource "azurerm_virtual_desktop_application_group" "virtual_desktop_application_groups" {
  for_each = var.virtual_desktop_application_groups

  host_pool_id                 = each.value.host_pool_id
  location                     = each.value.location
  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
  type                         = each.value.type
  default_desktop_display_name = each.value.default_desktop_display_name
  description                  = each.value.description
  friendly_name                = each.value.friendly_name
  tags                         = each.value.tags
}
