resource "azurerm_purview_account" "purview_accounts" {
  for_each = var.purview_accounts

  location                    = each.value.location
  name                        = each.value.name
  resource_group_name         = each.value.resource_group_name
  managed_event_hub_enabled   = each.value.managed_event_hub_enabled
  managed_resource_group_name = each.value.managed_resource_group_name
  public_network_enabled      = each.value.public_network_enabled
  tags                        = each.value.tags

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }
}
