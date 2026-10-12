resource "azurerm_storage_mover_project" "storage_mover_projects" {
  for_each = var.storage_mover_projects

  name             = each.value.name
  storage_mover_id = each.value.storage_mover_id
  description      = each.value.description
}
