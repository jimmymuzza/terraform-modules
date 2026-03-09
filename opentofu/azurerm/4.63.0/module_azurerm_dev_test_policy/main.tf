resource "azurerm_dev_test_policy" "dev_test_policies" {
  for_each = var.dev_test_policies

  evaluator_type      = each.value.evaluator_type
  lab_name            = each.value.lab_name
  name                = each.value.name
  policy_set_name     = each.value.policy_set_name
  resource_group_name = each.value.resource_group_name
  threshold           = each.value.threshold
  description         = each.value.description
  fact_data           = each.value.fact_data
  tags                = each.value.tags
}
