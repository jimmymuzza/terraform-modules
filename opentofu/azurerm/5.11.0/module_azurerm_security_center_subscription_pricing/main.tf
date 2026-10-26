resource "azurerm_security_center_subscription_pricing" "security_center_subscription_pricings" {
  for_each = var.security_center_subscription_pricings

  tier          = each.value.tier
  resource_type = each.value.resource_type
  subplan       = each.value.subplan

  dynamic "extension" {
    for_each = each.value.extension != null ? each.value.extension : []
    content {
      name                            = extension.value.name
      additional_extension_properties = extension.value.additional_extension_properties
    }
  }
}
