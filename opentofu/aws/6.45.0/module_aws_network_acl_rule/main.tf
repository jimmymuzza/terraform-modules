resource "aws_network_acl_rule" "network_acl_rules" {
  for_each = var.network_acl_rules

  network_acl_id  = each.value.network_acl_id
  protocol        = each.value.protocol
  rule_action     = each.value.rule_action
  rule_number     = each.value.rule_number
  cidr_block      = each.value.cidr_block
  egress          = each.value.egress
  from_port       = each.value.from_port
  icmp_code       = each.value.icmp_code
  icmp_type       = each.value.icmp_type
  ipv6_cidr_block = each.value.ipv6_cidr_block
  region          = each.value.region
  to_port         = each.value.to_port
}
