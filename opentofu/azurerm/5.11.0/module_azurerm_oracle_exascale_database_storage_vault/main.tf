resource "azurerm_oracle_exascale_database_storage_vault" "oracle_exascale_database_storage_vaults" {
  for_each = var.oracle_exascale_database_storage_vaults

  additional_flash_cache_percentage = each.value.additional_flash_cache_percentage
  display_name                      = each.value.display_name
  location                          = each.value.location
  name                              = each.value.name
  resource_group_name               = each.value.resource_group_name
  zones                             = each.value.zones
  description                       = each.value.description
  tags                              = each.value.tags
  time_zone                         = each.value.time_zone

  dynamic "high_capacity_database_storage" {
    for_each = each.value.high_capacity_database_storage != null ? each.value.high_capacity_database_storage : []
    content {
      total_size_in_gb = high_capacity_database_storage.value.total_size_in_gb
    }
  }
}
