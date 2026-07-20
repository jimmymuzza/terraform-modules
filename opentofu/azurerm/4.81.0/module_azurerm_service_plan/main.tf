resource "azurerm_service_plan" "service_plans" {
  for_each = var.service_plans

  location                        = each.value.location
  name                            = each.value.name
  os_type                         = each.value.os_type
  resource_group_name             = each.value.resource_group_name
  sku_name                        = each.value.sku_name
  app_service_environment_id      = each.value.app_service_environment_id
  maximum_elastic_worker_count    = each.value.maximum_elastic_worker_count
  per_site_scaling_enabled        = each.value.per_site_scaling_enabled
  premium_plan_auto_scale_enabled = each.value.premium_plan_auto_scale_enabled
  tags                            = each.value.tags
  worker_count                    = each.value.worker_count
  zone_balancing_enabled          = each.value.zone_balancing_enabled
}
