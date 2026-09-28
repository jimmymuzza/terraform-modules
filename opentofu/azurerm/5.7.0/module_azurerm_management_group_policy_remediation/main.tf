resource "azurerm_management_group_policy_remediation" "management_group_policy_remediations" {
  for_each = var.management_group_policy_remediations

  management_group_id            = each.value.management_group_id
  name                           = each.value.name
  policy_assignment_id           = each.value.policy_assignment_id
  failure_percentage             = each.value.failure_percentage
  location_filters               = each.value.location_filters
  parallel_deployments           = each.value.parallel_deployments
  policy_definition_reference_id = each.value.policy_definition_reference_id
  resource_count                 = each.value.resource_count
}
