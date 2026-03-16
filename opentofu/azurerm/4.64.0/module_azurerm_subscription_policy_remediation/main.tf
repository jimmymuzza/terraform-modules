resource "azurerm_subscription_policy_remediation" "subscription_policy_remediations" {
  for_each = var.subscription_policy_remediations

  name                           = each.value.name
  policy_assignment_id           = each.value.policy_assignment_id
  subscription_id                = each.value.subscription_id
  failure_percentage             = each.value.failure_percentage
  location_filters               = each.value.location_filters
  parallel_deployments           = each.value.parallel_deployments
  policy_definition_reference_id = each.value.policy_definition_reference_id
  resource_count                 = each.value.resource_count
  resource_discovery_mode        = each.value.resource_discovery_mode
}
