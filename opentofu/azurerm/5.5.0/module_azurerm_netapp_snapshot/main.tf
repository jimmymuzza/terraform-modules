resource "azurerm_netapp_snapshot" "netapp_snapshots" {
  for_each = var.netapp_snapshots

  account_name        = each.value.account_name
  location            = each.value.location
  name                = each.value.name
  pool_name           = each.value.pool_name
  resource_group_name = each.value.resource_group_name
  volume_name         = each.value.volume_name
}
