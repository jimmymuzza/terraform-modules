resource "azurerm_application_load_balancer_security_policy" "application_load_balancer_security_policies" {
  for_each = var.application_load_balancer_security_policies

  application_load_balancer_id       = each.value.application_load_balancer_id
  location                           = each.value.location
  name                               = each.value.name
  web_application_firewall_policy_id = each.value.web_application_firewall_policy_id
  tags                               = each.value.tags
}
