resource "aws_security_group_rule" "security_group_rules" {
  for_each = var.security_group_rules

  from_port                = each.value.from_port
  protocol                 = each.value.protocol
  security_group_id        = each.value.security_group_id
  to_port                  = each.value.to_port
  type                     = each.value.type
  cidr_blocks              = each.value.cidr_blocks
  description              = each.value.description
  ipv6_cidr_blocks         = each.value.ipv6_cidr_blocks
  prefix_list_ids          = each.value.prefix_list_ids
  region                   = each.value.region
  self                     = each.value.self
  source_security_group_id = each.value.source_security_group_id
}
