resource "azurerm_data_factory_custom_dataset" "data_factory_custom_datasets" {
  for_each = var.data_factory_custom_datasets

  data_factory_id       = each.value.data_factory_id
  name                  = each.value.name
  type                  = each.value.type
  type_properties_json  = each.value.type_properties_json
  additional_properties = each.value.additional_properties
  annotations           = each.value.annotations
  description           = each.value.description
  folder                = each.value.folder
  parameters            = each.value.parameters
  schema_json           = each.value.schema_json

  dynamic "linked_service" {
    for_each = each.value.linked_service != null ? each.value.linked_service : []
    content {
      name       = linked_service.value.name
      parameters = linked_service.value.parameters
    }
  }
}
