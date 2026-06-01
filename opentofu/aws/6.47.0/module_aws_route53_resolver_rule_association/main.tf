resource "aws_route53_resolver_rule_association" "route53_resolver_rule_associations" {
  for_each = var.route53_resolver_rule_associations

  resolver_rule_id = each.value.resolver_rule_id
  vpc_id           = each.value.vpc_id
  name             = each.value.name
  region           = each.value.region
}
