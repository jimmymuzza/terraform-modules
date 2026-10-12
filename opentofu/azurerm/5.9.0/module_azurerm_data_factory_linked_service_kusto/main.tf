resource "azurerm_data_factory_linked_service_kusto" "data_factory_linked_service_kustos" {
  for_each = var.data_factory_linked_service_kustos

  data_factory_id          = each.value.data_factory_id
  kusto_database_name      = each.value.kusto_database_name
  kusto_endpoint           = each.value.kusto_endpoint
  name                     = each.value.name
  additional_properties    = each.value.additional_properties
  annotations              = each.value.annotations
  description              = each.value.description
  integration_runtime_name = each.value.integration_runtime_name
  parameters               = each.value.parameters
  service_principal_id     = each.value.service_principal_id
  service_principal_key    = each.value.service_principal_key
  tenant                   = each.value.tenant
  use_managed_identity     = each.value.use_managed_identity
}
