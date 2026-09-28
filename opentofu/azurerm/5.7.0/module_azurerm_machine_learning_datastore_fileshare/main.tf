resource "azurerm_machine_learning_datastore_fileshare" "machine_learning_datastore_fileshares" {
  for_each = var.machine_learning_datastore_fileshares

  name                    = each.value.name
  storage_fileshare_id    = each.value.storage_fileshare_id
  workspace_id            = each.value.workspace_id
  account_key             = each.value.account_key
  description             = each.value.description
  service_data_identity   = each.value.service_data_identity
  shared_access_signature = each.value.shared_access_signature
  tags                    = each.value.tags
}
