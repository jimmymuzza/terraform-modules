resource "azurerm_netapp_backup_policy" "netapp_backup_policies" {
  for_each = var.netapp_backup_policies

  account_name            = each.value.account_name
  location                = each.value.location
  name                    = each.value.name
  resource_group_name     = each.value.resource_group_name
  daily_backups_to_keep   = each.value.daily_backups_to_keep
  enabled                 = each.value.enabled
  monthly_backups_to_keep = each.value.monthly_backups_to_keep
  tags                    = each.value.tags
  weekly_backups_to_keep  = each.value.weekly_backups_to_keep
}
