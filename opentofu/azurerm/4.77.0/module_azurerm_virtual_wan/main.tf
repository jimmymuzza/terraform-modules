resource "azurerm_virtual_wan" "virtual_wans" {
  for_each = var.virtual_wans

  location                          = each.value.location
  name                              = each.value.name
  resource_group_name               = each.value.resource_group_name
  allow_branch_to_branch_traffic    = each.value.allow_branch_to_branch_traffic
  disable_vpn_encryption            = each.value.disable_vpn_encryption
  office365_local_breakout_category = each.value.office365_local_breakout_category
  tags                              = each.value.tags
  type                              = each.value.type
}
