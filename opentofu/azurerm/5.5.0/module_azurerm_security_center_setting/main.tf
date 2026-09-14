resource "azurerm_security_center_setting" "security_center_settings" {
  for_each = var.security_center_settings

  enabled      = each.value.enabled
  setting_name = each.value.setting_name
}
