resource "aws_route53_resolver_query_log_config_association" "route53_resolver_query_log_config_associations" {
  for_each = var.route53_resolver_query_log_config_associations

  resolver_query_log_config_id = each.value.resolver_query_log_config_id
  resource_id                  = each.value.resource_id
  region                       = each.value.region
}
