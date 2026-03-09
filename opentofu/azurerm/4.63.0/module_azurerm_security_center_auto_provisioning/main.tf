resource "azurerm_security_center_auto_provisioning" "security_center_auto_provisionings" {
  for_each = var.security_center_auto_provisionings

  auto_provision = each.value.auto_provision
}
