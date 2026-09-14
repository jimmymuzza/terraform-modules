resource "azurerm_netapp_backup_vault" "netapp_backup_vaults" {
  for_each = var.netapp_backup_vaults

  account_name        = each.value.account_name
  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  tags                = each.value.tags
}
