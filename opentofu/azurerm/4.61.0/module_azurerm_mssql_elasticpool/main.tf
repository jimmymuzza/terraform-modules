resource "azurerm_mssql_elasticpool" "mssql_elasticpools" {
  for_each = var.mssql_elasticpools

  location                       = each.value.location
  name                           = each.value.name
  resource_group_name            = each.value.resource_group_name
  server_name                    = each.value.server_name
  enclave_type                   = each.value.enclave_type
  license_type                   = each.value.license_type
  maintenance_configuration_name = each.value.maintenance_configuration_name
  max_size_bytes                 = each.value.max_size_bytes
  max_size_gb                    = each.value.max_size_gb
  tags                           = each.value.tags
  zone_redundant                 = each.value.zone_redundant

  dynamic "per_database_settings" {
    for_each = each.value.per_database_settings != null ? each.value.per_database_settings : []
    content {
      max_capacity = per_database_settings.value.max_capacity
      min_capacity = per_database_settings.value.min_capacity
    }
  }

  dynamic "sku" {
    for_each = each.value.sku != null ? each.value.sku : []
    content {
      capacity = sku.value.capacity
      name     = sku.value.name
      tier     = sku.value.tier
      family   = sku.value.family
    }
  }
}
