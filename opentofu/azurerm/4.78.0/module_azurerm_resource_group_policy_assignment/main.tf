resource "azurerm_resource_group_policy_assignment" "resource_group_policy_assignments" {
  for_each = var.resource_group_policy_assignments

  name                 = each.value.name
  policy_definition_id = each.value.policy_definition_id
  resource_group_id    = each.value.resource_group_id
  description          = each.value.description
  display_name         = each.value.display_name
  enforce              = each.value.enforce
  location             = each.value.location
  metadata             = each.value.metadata
  not_scopes           = each.value.not_scopes
  parameters           = each.value.parameters

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "non_compliance_message" {
    for_each = each.value.non_compliance_message != null ? each.value.non_compliance_message : []
    content {
      content                        = non_compliance_message.value.content
      policy_definition_reference_id = non_compliance_message.value.policy_definition_reference_id
    }
  }

  dynamic "overrides" {
    for_each = each.value.overrides != null ? each.value.overrides : []
    content {
      value = overrides.value.value

      dynamic "selectors" {
        for_each = overrides.value.selectors != null ? overrides.value.selectors : []
        content {
          in     = selectors.value.in
          kind   = selectors.value.kind
          not_in = selectors.value.not_in
        }
      }
    }
  }

  dynamic "resource_selectors" {
    for_each = each.value.resource_selectors != null ? each.value.resource_selectors : []
    content {
      name = resource_selectors.value.name

      dynamic "selectors" {
        for_each = resource_selectors.value.selectors != null ? resource_selectors.value.selectors : []
        content {
          kind   = selectors.value.kind
          in     = selectors.value.in
          not_in = selectors.value.not_in
        }
      }
    }
  }
}
