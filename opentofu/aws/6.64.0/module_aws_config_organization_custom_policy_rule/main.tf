resource "aws_config_organization_custom_policy_rule" "config_organization_custom_policy_rules" {
  for_each = var.config_organization_custom_policy_rules

  name                        = each.value.name
  policy_runtime              = each.value.policy_runtime
  policy_text                 = each.value.policy_text
  trigger_types               = each.value.trigger_types
  debug_log_delivery_accounts = each.value.debug_log_delivery_accounts
  description                 = each.value.description
  excluded_accounts           = each.value.excluded_accounts
  input_parameters            = each.value.input_parameters
  maximum_execution_frequency = each.value.maximum_execution_frequency
  region                      = each.value.region
  resource_id_scope           = each.value.resource_id_scope
  resource_types_scope        = each.value.resource_types_scope
  tag_key_scope               = each.value.tag_key_scope
  tag_value_scope             = each.value.tag_value_scope
}
