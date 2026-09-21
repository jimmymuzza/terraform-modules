resource "aws_cloudwatch_event_api_destination" "cloudwatch_event_api_destinations" {
  for_each = var.cloudwatch_event_api_destinations

  connection_arn                   = each.value.connection_arn
  http_method                      = each.value.http_method
  invocation_endpoint              = each.value.invocation_endpoint
  name                             = each.value.name
  description                      = each.value.description
  invocation_rate_limit_per_second = each.value.invocation_rate_limit_per_second
  region                           = each.value.region
}
