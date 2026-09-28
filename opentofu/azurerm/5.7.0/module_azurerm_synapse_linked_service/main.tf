resource "azurerm_synapse_linked_service" "synapse_linked_services" {
  for_each = var.synapse_linked_services

  name                  = each.value.name
  synapse_workspace_id  = each.value.synapse_workspace_id
  type                  = each.value.type
  type_properties_json  = each.value.type_properties_json
  additional_properties = each.value.additional_properties
  annotations           = each.value.annotations
  description           = each.value.description
  parameters            = each.value.parameters

  dynamic "integration_runtime" {
    for_each = each.value.integration_runtime != null ? each.value.integration_runtime : []
    content {
      name       = integration_runtime.value.name
      parameters = integration_runtime.value.parameters
    }
  }
}
