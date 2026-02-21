resource "aws_cloudwatch_log_stream" "cloudwatch_log_streams" {
  for_each = var.cloudwatch_log_streams

  log_group_name = each.value.log_group_name
  name           = each.value.name
  region         = each.value.region
}
