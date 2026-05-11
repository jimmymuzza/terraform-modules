resource "azurerm_machine_learning_datastore_datalake_gen2" "machine_learning_datastore_datalake_gen2s" {
  for_each = var.machine_learning_datastore_datalake_gen2s

  name                  = each.value.name
  storage_container_id  = each.value.storage_container_id
  workspace_id          = each.value.workspace_id
  authority_url         = each.value.authority_url
  client_id             = each.value.client_id
  client_secret         = each.value.client_secret
  description           = each.value.description
  service_data_identity = each.value.service_data_identity
  tags                  = each.value.tags
  tenant_id             = each.value.tenant_id
}
