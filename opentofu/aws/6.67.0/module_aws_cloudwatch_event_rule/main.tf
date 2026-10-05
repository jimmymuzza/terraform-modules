resource "aws_cloudwatch_event_rule" "cloudwatch_event_rules" {
  for_each = var.cloudwatch_event_rules

  description         = each.value.description
  event_bus_name      = each.value.event_bus_name
  event_pattern       = each.value.event_pattern
  force_destroy       = each.value.force_destroy
  is_enabled          = each.value.is_enabled
  name                = each.value.name
  name_prefix         = each.value.name_prefix
  region              = each.value.region
  role_arn            = each.value.role_arn
  schedule_expression = each.value.schedule_expression
  state               = each.value.state
  tags                = each.value.tags
  tags_all            = each.value.tags_all
}
