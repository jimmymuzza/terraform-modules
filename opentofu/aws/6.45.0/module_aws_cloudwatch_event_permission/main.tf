resource "aws_cloudwatch_event_permission" "cloudwatch_event_permissions" {
  for_each = var.cloudwatch_event_permissions

  principal      = each.value.principal
  statement_id   = each.value.statement_id
  action         = each.value.action
  event_bus_name = each.value.event_bus_name
  region         = each.value.region

  dynamic "condition" {
    for_each = each.value.condition != null ? each.value.condition : []
    content {
      key   = condition.value.key
      type  = condition.value.type
      value = condition.value.value
    }
  }
}
