resource "aws_default_security_group" "default_security_groups" {
  for_each = var.default_security_groups

  egress                 = each.value.egress
  ingress                = each.value.ingress
  region                 = each.value.region
  revoke_rules_on_delete = each.value.revoke_rules_on_delete
  tags                   = each.value.tags
  tags_all               = each.value.tags_all
  vpc_id                 = each.value.vpc_id
}
