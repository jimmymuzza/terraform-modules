resource "aws_vpc_security_group_rules_exclusive" "vpc_security_group_rules_exclusives" {
  for_each = var.vpc_security_group_rules_exclusives

  egress_rule_ids   = each.value.egress_rule_ids
  ingress_rule_ids  = each.value.ingress_rule_ids
  security_group_id = each.value.security_group_id
  region            = each.value.region
}
