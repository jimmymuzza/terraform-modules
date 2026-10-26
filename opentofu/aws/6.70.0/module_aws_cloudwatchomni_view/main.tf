resource "aws_cloudwatchomni_view" "cloudwatchomni_views" {
  for_each = var.cloudwatchomni_views

  definition  = each.value.definition
  name        = each.value.name
  description = each.value.description
  region      = each.value.region
  tags        = each.value.tags
}
