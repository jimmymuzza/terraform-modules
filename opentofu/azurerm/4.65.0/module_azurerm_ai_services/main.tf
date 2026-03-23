resource "azurerm_ai_services" "ai_services" {
  for_each = var.ai_services

  location                           = each.value.location
  name                               = each.value.name
  resource_group_name                = each.value.resource_group_name
  sku_name                           = each.value.sku_name
  custom_subdomain_name              = each.value.custom_subdomain_name
  fqdns                              = each.value.fqdns
  local_authentication_enabled       = each.value.local_authentication_enabled
  outbound_network_access_restricted = each.value.outbound_network_access_restricted
  public_network_access              = each.value.public_network_access
  tags                               = each.value.tags

  dynamic "customer_managed_key" {
    for_each = each.value.customer_managed_key != null ? each.value.customer_managed_key : []
    content {
      identity_client_id = customer_managed_key.value.identity_client_id
      key_vault_key_id   = customer_managed_key.value.key_vault_key_id
      managed_hsm_key_id = customer_managed_key.value.managed_hsm_key_id
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "network_acls" {
    for_each = each.value.network_acls != null ? each.value.network_acls : []
    content {
      default_action = network_acls.value.default_action
      bypass         = network_acls.value.bypass
      ip_rules       = network_acls.value.ip_rules

      dynamic "virtual_network_rules" {
        for_each = network_acls.value.virtual_network_rules != null ? network_acls.value.virtual_network_rules : []
        content {
          subnet_id                            = virtual_network_rules.value.subnet_id
          ignore_missing_vnet_service_endpoint = virtual_network_rules.value.ignore_missing_vnet_service_endpoint
        }
      }
    }
  }

  dynamic "storage" {
    for_each = each.value.storage != null ? each.value.storage : []
    content {
      storage_account_id = storage.value.storage_account_id
      identity_client_id = storage.value.identity_client_id
    }
  }
}
