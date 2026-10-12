resource "azurerm_resource_group_policy_remediation" "resource_group_policy_remediations" {
  for_each = var.resource_group_policy_remediations

  name                           = each.value.name
  policy_assignment_id           = each.value.policy_assignment_id
  resource_group_id              = each.value.resource_group_id
  failure_percentage             = each.value.failure_percentage
  location_filters               = each.value.location_filters
  parallel_deployments           = each.value.parallel_deployments
  policy_definition_reference_id = each.value.policy_definition_reference_id
  resource_count                 = each.value.resource_count
  resource_discovery_mode        = each.value.resource_discovery_mode
}
