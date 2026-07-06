resource "azurerm_database_migration_service" "database_migration_services" {
  for_each = var.database_migration_services

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  sku_name            = each.value.sku_name
  subnet_id           = each.value.subnet_id
  tags                = each.value.tags
}
