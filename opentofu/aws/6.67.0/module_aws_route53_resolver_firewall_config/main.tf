resource "aws_route53_resolver_firewall_config" "route53_resolver_firewall_configs" {
  for_each = var.route53_resolver_firewall_configs

  resource_id        = each.value.resource_id
  firewall_fail_open = each.value.firewall_fail_open
  region             = each.value.region
}
