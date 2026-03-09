resource "aws_route53_resolver_firewall_rule_group_association" "route53_resolver_firewall_rule_group_associations" {
  for_each = var.route53_resolver_firewall_rule_group_associations

  firewall_rule_group_id = each.value.firewall_rule_group_id
  name                   = each.value.name
  priority               = each.value.priority
  vpc_id                 = each.value.vpc_id
  mutation_protection    = each.value.mutation_protection
  region                 = each.value.region
  tags                   = each.value.tags
  tags_all               = each.value.tags_all
}
