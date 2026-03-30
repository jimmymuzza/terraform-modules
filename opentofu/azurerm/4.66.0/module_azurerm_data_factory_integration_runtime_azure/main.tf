resource "azurerm_data_factory_integration_runtime_azure" "data_factory_integration_runtime_azures" {
  for_each = var.data_factory_integration_runtime_azures

  data_factory_id         = each.value.data_factory_id
  location                = each.value.location
  name                    = each.value.name
  cleanup_enabled         = each.value.cleanup_enabled
  compute_type            = each.value.compute_type
  core_count              = each.value.core_count
  description             = each.value.description
  time_to_live_min        = each.value.time_to_live_min
  virtual_network_enabled = each.value.virtual_network_enabled
}
