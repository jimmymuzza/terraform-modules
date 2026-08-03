resource "azurerm_security_center_assessment_policy" "security_center_assessment_policies" {
  for_each = var.security_center_assessment_policies

  description             = each.value.description
  display_name            = each.value.display_name
  categories              = each.value.categories
  implementation_effort   = each.value.implementation_effort
  remediation_description = each.value.remediation_description
  severity                = each.value.severity
  threats                 = each.value.threats
  user_impact             = each.value.user_impact
}
