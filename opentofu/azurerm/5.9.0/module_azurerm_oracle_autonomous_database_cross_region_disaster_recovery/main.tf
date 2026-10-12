resource "azurerm_oracle_autonomous_database_cross_region_disaster_recovery" "oracle_autonomous_database_cross_region_disaster_recoveries" {
  for_each = var.oracle_autonomous_database_cross_region_disaster_recoveries

  display_name                        = each.value.display_name
  location                            = each.value.location
  name                                = each.value.name
  resource_group_name                 = each.value.resource_group_name
  source_autonomous_database_id       = each.value.source_autonomous_database_id
  subnet_id                           = each.value.subnet_id
  replicate_automatic_backups_enabled = each.value.replicate_automatic_backups_enabled
  tags                                = each.value.tags
}
