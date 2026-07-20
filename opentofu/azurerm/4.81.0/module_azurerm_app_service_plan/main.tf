resource "azurerm_app_service_plan" "app_service_plans" {
  for_each = var.app_service_plans

  location                     = each.value.location
  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
  app_service_environment_id   = each.value.app_service_environment_id
  is_xenon                     = each.value.is_xenon
  kind                         = each.value.kind
  maximum_elastic_worker_count = each.value.maximum_elastic_worker_count
  per_site_scaling             = each.value.per_site_scaling
  reserved                     = each.value.reserved
  tags                         = each.value.tags
  zone_redundant               = each.value.zone_redundant

  dynamic "sku" {
    for_each = each.value.sku != null ? each.value.sku : []
    content {
      size     = sku.value.size
      tier     = sku.value.tier
      capacity = sku.value.capacity
    }
  }
}
