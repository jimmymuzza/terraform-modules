resource "azurerm_machine_learning_datastore_blobstorage" "machine_learning_datastore_blobstorages" {
  for_each = var.machine_learning_datastore_blobstorages

  name                       = each.value.name
  storage_container_id       = each.value.storage_container_id
  workspace_id               = each.value.workspace_id
  account_key                = each.value.account_key
  description                = each.value.description
  is_default                 = each.value.is_default
  service_data_auth_identity = each.value.service_data_auth_identity
  shared_access_signature    = each.value.shared_access_signature
  tags                       = each.value.tags
}
