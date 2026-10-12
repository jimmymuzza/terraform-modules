resource "azurerm_data_factory_credential_service_principal" "data_factory_credential_service_principals" {
  for_each = var.data_factory_credential_service_principals

  data_factory_id      = each.value.data_factory_id
  name                 = each.value.name
  service_principal_id = each.value.service_principal_id
  tenant_id            = each.value.tenant_id
  annotations          = each.value.annotations
  description          = each.value.description

  dynamic "service_principal_key" {
    for_each = each.value.service_principal_key != null ? each.value.service_principal_key : []
    content {
      linked_service_name = service_principal_key.value.linked_service_name
      secret_name         = service_principal_key.value.secret_name
      secret_version      = service_principal_key.value.secret_version
    }
  }
}
