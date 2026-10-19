resource "azurerm_search_service" "search_services" {
  for_each = var.search_services

  location                                 = each.value.location
  name                                     = each.value.name
  resource_group_name                      = each.value.resource_group_name
  sku                                      = each.value.sku
  allowed_ips                              = each.value.allowed_ips
  authentication_failure_mode              = each.value.authentication_failure_mode
  customer_managed_key_enforcement_enabled = each.value.customer_managed_key_enforcement_enabled
  hosting_mode                             = each.value.hosting_mode
  local_authentication_enabled             = each.value.local_authentication_enabled
  network_rule_bypass_option               = each.value.network_rule_bypass_option
  partition_count                          = each.value.partition_count
  public_network_access_enabled            = each.value.public_network_access_enabled
  replica_count                            = each.value.replica_count
  semantic_search_sku                      = each.value.semantic_search_sku
  tags                                     = each.value.tags

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }
}
