resource "azurerm_storage_account_network_rules" "storage_account_network_rules" {
  for_each = var.storage_account_network_rules

  default_action             = each.value.default_action
  storage_account_id         = each.value.storage_account_id
  bypass                     = each.value.bypass
  ip_rules                   = each.value.ip_rules
  virtual_network_subnet_ids = each.value.virtual_network_subnet_ids

  dynamic "private_link_access" {
    for_each = each.value.private_link_access != null ? each.value.private_link_access : []
    content {
      endpoint_resource_id = private_link_access.value.endpoint_resource_id
      endpoint_tenant_id   = private_link_access.value.endpoint_tenant_id
    }
  }
}
