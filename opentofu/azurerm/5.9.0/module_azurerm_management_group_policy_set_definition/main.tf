resource "azurerm_management_group_policy_set_definition" "management_group_policy_set_definitions" {
  for_each = var.management_group_policy_set_definitions

  display_name        = each.value.display_name
  management_group_id = each.value.management_group_id
  name                = each.value.name
  policy_type         = each.value.policy_type
  description         = each.value.description
  metadata            = each.value.metadata
  parameters          = each.value.parameters

  dynamic "policy_definition_group" {
    for_each = each.value.policy_definition_group != null ? each.value.policy_definition_group : []
    content {
      name                            = policy_definition_group.value.name
      additional_metadata_resource_id = policy_definition_group.value.additional_metadata_resource_id
      category                        = policy_definition_group.value.category
      description                     = policy_definition_group.value.description
      display_name                    = policy_definition_group.value.display_name
    }
  }

  dynamic "policy_definition_reference" {
    for_each = each.value.policy_definition_reference != null ? each.value.policy_definition_reference : []
    content {
      policy_definition_id = policy_definition_reference.value.policy_definition_id
      parameter_values     = policy_definition_reference.value.parameter_values
      policy_group_names   = policy_definition_reference.value.policy_group_names
      reference_id         = policy_definition_reference.value.reference_id
      version              = policy_definition_reference.value.version
    }
  }
}
