resource "aws_route53recoveryreadiness_recovery_group" "route53recoveryreadiness_recovery_groups" {
  for_each = var.route53recoveryreadiness_recovery_groups

  recovery_group_name = each.value.recovery_group_name
  cells               = each.value.cells
  tags                = each.value.tags
  tags_all            = each.value.tags_all
}
