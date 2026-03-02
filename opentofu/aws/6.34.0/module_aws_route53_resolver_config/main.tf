resource "aws_route53_resolver_config" "route53_resolver_configs" {
  for_each = var.route53_resolver_configs

  autodefined_reverse_flag = each.value.autodefined_reverse_flag
  resource_id              = each.value.resource_id
  region                   = each.value.region
}
