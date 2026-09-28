resource "aws_route53_query_log" "route53_query_logs" {
  for_each = var.route53_query_logs

  cloudwatch_log_group_arn = each.value.cloudwatch_log_group_arn
  zone_id                  = each.value.zone_id
}
