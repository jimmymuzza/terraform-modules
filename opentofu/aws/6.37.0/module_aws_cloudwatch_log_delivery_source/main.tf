resource "aws_cloudwatch_log_delivery_source" "cloudwatch_log_delivery_sources" {
  for_each = var.cloudwatch_log_delivery_sources

  log_type     = each.value.log_type
  name         = each.value.name
  resource_arn = each.value.resource_arn
  region       = each.value.region
  tags         = each.value.tags
}
