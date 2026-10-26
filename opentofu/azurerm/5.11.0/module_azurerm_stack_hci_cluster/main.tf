resource "azurerm_stack_hci_cluster" "stack_hci_clusters" {
  for_each = var.stack_hci_clusters

  location                    = each.value.location
  name                        = each.value.name
  resource_group_name         = each.value.resource_group_name
  automanage_configuration_id = each.value.automanage_configuration_id
  client_id                   = each.value.client_id
  tags                        = each.value.tags
  tenant_id                   = each.value.tenant_id

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type = identity.value.type
    }
  }
}
