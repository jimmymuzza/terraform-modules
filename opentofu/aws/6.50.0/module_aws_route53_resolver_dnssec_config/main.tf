resource "aws_route53_resolver_dnssec_config" "route53_resolver_dnssec_configs" {
  for_each = var.route53_resolver_dnssec_configs

  resource_id = each.value.resource_id
  region      = each.value.region
}
