resource "aws_vpc_security_group_egress_rule" "vpc_security_group_egress_rules" {
  for_each = var.vpc_security_group_egress_rules

  ip_protocol                  = each.value.ip_protocol
  security_group_id            = each.value.security_group_id
  cidr_ipv4                    = each.value.cidr_ipv4
  cidr_ipv6                    = each.value.cidr_ipv6
  description                  = each.value.description
  from_port                    = each.value.from_port
  prefix_list_id               = each.value.prefix_list_id
  referenced_security_group_id = each.value.referenced_security_group_id
  region                       = each.value.region
  tags                         = each.value.tags
  to_port                      = each.value.to_port
}
