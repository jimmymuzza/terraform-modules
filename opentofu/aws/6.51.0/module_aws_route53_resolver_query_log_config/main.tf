resource "aws_route53_resolver_query_log_config" "route53_resolver_query_log_configs" {
  for_each = var.route53_resolver_query_log_configs

  destination_arn = each.value.destination_arn
  name            = each.value.name
  region          = each.value.region
  tags            = each.value.tags
  tags_all        = each.value.tags_all
}
