resource "azurerm_fluid_relay_server" "fluid_relay_servers" {
  for_each = var.fluid_relay_servers

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  storage_sku         = each.value.storage_sku
  tags                = each.value.tags

  dynamic "customer_managed_key" {
    for_each = each.value.customer_managed_key != null ? each.value.customer_managed_key : []
    content {
      key_vault_key_id          = customer_managed_key.value.key_vault_key_id
      user_assigned_identity_id = customer_managed_key.value.user_assigned_identity_id
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }
}
