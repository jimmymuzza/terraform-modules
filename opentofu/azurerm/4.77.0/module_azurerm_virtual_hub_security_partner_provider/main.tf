resource "azurerm_virtual_hub_security_partner_provider" "virtual_hub_security_partner_providers" {
  for_each = var.virtual_hub_security_partner_providers

  location               = each.value.location
  name                   = each.value.name
  resource_group_name    = each.value.resource_group_name
  security_provider_name = each.value.security_provider_name
  tags                   = each.value.tags
  virtual_hub_id         = each.value.virtual_hub_id
}
