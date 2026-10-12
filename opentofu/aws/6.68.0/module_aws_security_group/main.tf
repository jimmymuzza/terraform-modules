resource "aws_security_group" "security_groups" {
  for_each = var.security_groups

  description            = each.value.description
  egress                 = each.value.egress
  ingress                = each.value.ingress
  name                   = each.value.name
  name_prefix            = each.value.name_prefix
  region                 = each.value.region
  revoke_rules_on_delete = each.value.revoke_rules_on_delete
  tags                   = each.value.tags
  tags_all               = each.value.tags_all
  vpc_id                 = each.value.vpc_id
}
