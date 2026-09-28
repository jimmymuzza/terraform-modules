resource "azurerm_arc_kubernetes_cluster" "arc_kubernetes_clusters" {
  for_each = var.arc_kubernetes_clusters

  agent_public_key_certificate = each.value.agent_public_key_certificate
  location                     = each.value.location
  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
  tags                         = each.value.tags

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type = identity.value.type
    }
  }
}
