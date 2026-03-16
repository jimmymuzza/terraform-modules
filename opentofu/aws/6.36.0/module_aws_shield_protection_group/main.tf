resource "aws_shield_protection_group" "shield_protection_groups" {
  for_each = var.shield_protection_groups

  aggregation         = each.value.aggregation
  pattern             = each.value.pattern
  protection_group_id = each.value.protection_group_id
  members             = each.value.members
  resource_type       = each.value.resource_type
  tags                = each.value.tags
  tags_all            = each.value.tags_all
}
