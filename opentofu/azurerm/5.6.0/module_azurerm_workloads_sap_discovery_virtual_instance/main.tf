resource "azurerm_workloads_sap_discovery_virtual_instance" "workloads_sap_discovery_virtual_instances" {
  for_each = var.workloads_sap_discovery_virtual_instances

  central_server_virtual_machine_id     = each.value.central_server_virtual_machine_id
  environment                           = each.value.environment
  location                              = each.value.location
  name                                  = each.value.name
  resource_group_name                   = each.value.resource_group_name
  sap_product                           = each.value.sap_product
  managed_resource_group_name           = each.value.managed_resource_group_name
  managed_resources_network_access_type = each.value.managed_resources_network_access_type
  managed_storage_account_name          = each.value.managed_storage_account_name
  tags                                  = each.value.tags

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      identity_ids = identity.value.identity_ids
      type         = identity.value.type
    }
  }
}
