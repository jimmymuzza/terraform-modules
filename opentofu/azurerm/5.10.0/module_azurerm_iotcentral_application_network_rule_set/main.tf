resource "azurerm_iotcentral_application_network_rule_set" "iotcentral_application_network_rule_sets" {
  for_each = var.iotcentral_application_network_rule_sets

  iotcentral_application_id = each.value.iotcentral_application_id
  apply_to_device           = each.value.apply_to_device
  default_action            = each.value.default_action

  dynamic "ip_rule" {
    for_each = each.value.ip_rule != null ? each.value.ip_rule : []
    content {
      ip_mask = ip_rule.value.ip_mask
      name    = ip_rule.value.name
    }
  }
}
