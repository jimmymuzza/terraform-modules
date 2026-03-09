resource "azurerm_storage_mover_source_endpoint" "storage_mover_source_endpoints" {
  for_each = var.storage_mover_source_endpoints

  host             = each.value.host
  name             = each.value.name
  storage_mover_id = each.value.storage_mover_id
  description      = each.value.description
  export           = each.value.export
  nfs_version      = each.value.nfs_version
}
