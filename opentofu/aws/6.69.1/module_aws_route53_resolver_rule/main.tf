resource "aws_route53_resolver_rule" "route53_resolver_rules" {
  for_each = var.route53_resolver_rules

  domain_name          = each.value.domain_name
  rule_type            = each.value.rule_type
  name                 = each.value.name
  region               = each.value.region
  resolver_endpoint_id = each.value.resolver_endpoint_id
  tags                 = each.value.tags
  tags_all             = each.value.tags_all

  dynamic "target_ip" {
    for_each = each.value.target_ip != null ? each.value.target_ip : []
    content {
      ip       = target_ip.value.ip
      ipv6     = target_ip.value.ipv6
      port     = target_ip.value.port
      protocol = target_ip.value.protocol
    }
  }
}
