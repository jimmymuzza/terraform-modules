resource "azurerm_trusted_signing_account" "trusted_signing_accounts" {
  for_each = var.trusted_signing_accounts

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  sku_name            = each.value.sku_name
  tags                = each.value.tags
}
