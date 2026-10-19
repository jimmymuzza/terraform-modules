resource "aws_cloudwatch_event_bus_policy" "cloudwatch_event_bus_policies" {
  for_each = var.cloudwatch_event_bus_policies

  policy         = each.value.policy
  event_bus_name = each.value.event_bus_name
  region         = each.value.region
}
