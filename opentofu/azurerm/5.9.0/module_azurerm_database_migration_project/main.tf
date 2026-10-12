resource "azurerm_database_migration_project" "database_migration_projects" {
  for_each = var.database_migration_projects

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  service_name        = each.value.service_name
  source_platform     = each.value.source_platform
  target_platform     = each.value.target_platform
  tags                = each.value.tags
}
