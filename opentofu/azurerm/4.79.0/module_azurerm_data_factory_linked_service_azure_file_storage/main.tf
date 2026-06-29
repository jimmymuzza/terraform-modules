resource "azurerm_data_factory_linked_service_azure_file_storage" "data_factory_linked_service_azure_file_storages" {
  for_each = var.data_factory_linked_service_azure_file_storages

  connection_string        = each.value.connection_string
  data_factory_id          = each.value.data_factory_id
  name                     = each.value.name
  additional_properties    = each.value.additional_properties
  annotations              = each.value.annotations
  description              = each.value.description
  file_share               = each.value.file_share
  host                     = each.value.host
  integration_runtime_name = each.value.integration_runtime_name
  parameters               = each.value.parameters
  password                 = each.value.password
  user_id                  = each.value.user_id

  dynamic "key_vault_password" {
    for_each = each.value.key_vault_password != null ? each.value.key_vault_password : []
    content {
      linked_service_name = key_vault_password.value.linked_service_name
      secret_name         = key_vault_password.value.secret_name
    }
  }
}
