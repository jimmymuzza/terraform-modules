resource "aws_cloudwatch_log_destination" "cloudwatch_log_destinations" {
  for_each = var.cloudwatch_log_destinations

  name       = each.value.name
  role_arn   = each.value.role_arn
  target_arn = each.value.target_arn
  region     = each.value.region
  tags       = each.value.tags
  tags_all   = each.value.tags_all
}
