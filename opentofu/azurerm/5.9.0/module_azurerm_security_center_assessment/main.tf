resource "azurerm_security_center_assessment" "security_center_assessments" {
  for_each = var.security_center_assessments

  assessment_policy_id = each.value.assessment_policy_id
  target_resource_id   = each.value.target_resource_id
  additional_data      = each.value.additional_data

  dynamic "status" {
    for_each = each.value.status != null ? each.value.status : []
    content {
      code        = status.value.code
      cause       = status.value.cause
      description = status.value.description
    }
  }
}
