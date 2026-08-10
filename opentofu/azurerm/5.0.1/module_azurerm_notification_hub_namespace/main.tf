resource "azurerm_notification_hub_namespace" "notification_hub_namespaces" {
  for_each = var.notification_hub_namespaces

  location                = each.value.location
  name                    = each.value.name
  namespace_type          = each.value.namespace_type
  resource_group_name     = each.value.resource_group_name
  sku_name                = each.value.sku_name
  enabled                 = each.value.enabled
  replication_region      = each.value.replication_region
  tags                    = each.value.tags
  zone_redundancy_enabled = each.value.zone_redundancy_enabled
}
