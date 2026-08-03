resource "azurerm_app_configuration" "app_configurations" {
  for_each = var.app_configurations

  location                                         = each.value.location
  name                                             = each.value.name
  resource_group_name                              = each.value.resource_group_name
  data_plane_proxy_authentication_mode             = each.value.data_plane_proxy_authentication_mode
  data_plane_proxy_private_link_delegation_enabled = each.value.data_plane_proxy_private_link_delegation_enabled
  local_auth_enabled                               = each.value.local_auth_enabled
  public_network_access                            = each.value.public_network_access
  purge_protection_enabled                         = each.value.purge_protection_enabled
  sku                                              = each.value.sku
  soft_delete_retention_days                       = each.value.soft_delete_retention_days
  tags                                             = each.value.tags

  dynamic "encryption" {
    for_each = each.value.encryption != null ? each.value.encryption : []
    content {
      identity_client_id       = encryption.value.identity_client_id
      key_vault_key_identifier = encryption.value.key_vault_key_identifier
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "replica" {
    for_each = each.value.replica != null ? each.value.replica : []
    content {
      location = replica.value.location
      name     = replica.value.name
    }
  }
}
