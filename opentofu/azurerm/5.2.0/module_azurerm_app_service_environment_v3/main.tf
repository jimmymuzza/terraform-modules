resource "azurerm_app_service_environment_v3" "app_service_environment_v3s" {
  for_each = var.app_service_environment_v3s

  name                                   = each.value.name
  resource_group_name                    = each.value.resource_group_name
  subnet_id                              = each.value.subnet_id
  allow_new_private_endpoint_connections = each.value.allow_new_private_endpoint_connections
  dedicated_host_count                   = each.value.dedicated_host_count
  internal_load_balancing_mode           = each.value.internal_load_balancing_mode
  remote_debugging_enabled               = each.value.remote_debugging_enabled
  tags                                   = each.value.tags
  zone_redundant                         = each.value.zone_redundant

  dynamic "cluster_setting" {
    for_each = each.value.cluster_setting != null ? each.value.cluster_setting : []
    content {
      name  = cluster_setting.value.name
      value = cluster_setting.value.value
    }
  }
}
