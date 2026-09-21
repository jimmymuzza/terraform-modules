resource "azurerm_vpn_server_configuration_policy_group" "vpn_server_configuration_policy_groups" {
  for_each = var.vpn_server_configuration_policy_groups

  name                        = each.value.name
  vpn_server_configuration_id = each.value.vpn_server_configuration_id
  is_default                  = each.value.is_default
  priority                    = each.value.priority

  dynamic "policy" {
    for_each = each.value.policy != null ? each.value.policy : []
    content {
      name  = policy.value.name
      type  = policy.value.type
      value = policy.value.value
    }
  }
}
