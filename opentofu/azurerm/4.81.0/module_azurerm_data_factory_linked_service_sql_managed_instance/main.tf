resource "azurerm_data_factory_linked_service_sql_managed_instance" "data_factory_linked_service_sql_managed_instances" {
  for_each = var.data_factory_linked_service_sql_managed_instances

  data_factory_id          = each.value.data_factory_id
  name                     = each.value.name
  annotations              = each.value.annotations
  connection_string        = each.value.connection_string
  description              = each.value.description
  integration_runtime_name = each.value.integration_runtime_name
  parameters               = each.value.parameters
  service_principal_id     = each.value.service_principal_id
  service_principal_key    = each.value.service_principal_key
  tenant                   = each.value.tenant

  dynamic "key_vault_connection_string" {
    for_each = each.value.key_vault_connection_string != null ? each.value.key_vault_connection_string : []
    content {
      linked_service_name = key_vault_connection_string.value.linked_service_name
      secret_name         = key_vault_connection_string.value.secret_name
    }
  }

  dynamic "key_vault_password" {
    for_each = each.value.key_vault_password != null ? each.value.key_vault_password : []
    content {
      linked_service_name = key_vault_password.value.linked_service_name
      secret_name         = key_vault_password.value.secret_name
    }
  }
}
