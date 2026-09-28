resource "aws_default_network_acl" "default_network_acls" {
  for_each = var.default_network_acls

  default_network_acl_id = each.value.default_network_acl_id
  region                 = each.value.region
  subnet_ids             = each.value.subnet_ids
  tags                   = each.value.tags
  tags_all               = each.value.tags_all

  dynamic "egress" {
    for_each = each.value.egress != null ? each.value.egress : []
    content {
      action          = egress.value.action
      from_port       = egress.value.from_port
      protocol        = egress.value.protocol
      rule_no         = egress.value.rule_no
      to_port         = egress.value.to_port
      cidr_block      = egress.value.cidr_block
      icmp_code       = egress.value.icmp_code
      icmp_type       = egress.value.icmp_type
      ipv6_cidr_block = egress.value.ipv6_cidr_block
    }
  }

  dynamic "ingress" {
    for_each = each.value.ingress != null ? each.value.ingress : []
    content {
      action          = ingress.value.action
      from_port       = ingress.value.from_port
      protocol        = ingress.value.protocol
      rule_no         = ingress.value.rule_no
      to_port         = ingress.value.to_port
      cidr_block      = ingress.value.cidr_block
      icmp_code       = ingress.value.icmp_code
      icmp_type       = ingress.value.icmp_type
      ipv6_cidr_block = ingress.value.ipv6_cidr_block
    }
  }
}
