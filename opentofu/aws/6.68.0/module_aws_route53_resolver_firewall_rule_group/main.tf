resource "aws_route53_resolver_firewall_rule_group" "route53_resolver_firewall_rule_groups" {
  for_each = var.route53_resolver_firewall_rule_groups

  name     = each.value.name
  region   = each.value.region
  tags     = each.value.tags
  tags_all = each.value.tags_all
}
