resource "aws_config_organization_custom_rule" "config_organization_custom_rules" {
  for_each = var.config_organization_custom_rules

  lambda_function_arn         = each.value.lambda_function_arn
  name                        = each.value.name
  trigger_types               = each.value.trigger_types
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
