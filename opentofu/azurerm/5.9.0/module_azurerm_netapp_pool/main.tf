resource "azurerm_netapp_pool" "netapp_pools" {
  for_each = var.netapp_pools

  account_name            = each.value.account_name
  location                = each.value.location
  name                    = each.value.name
  resource_group_name     = each.value.resource_group_name
  service_level           = each.value.service_level
  size_in_tb              = each.value.size_in_tb
  cool_access_enabled     = each.value.cool_access_enabled
  custom_throughput_mibps = each.value.custom_throughput_mibps
  encryption_type         = each.value.encryption_type
  qos_type                = each.value.qos_type
  tags                    = each.value.tags
}
