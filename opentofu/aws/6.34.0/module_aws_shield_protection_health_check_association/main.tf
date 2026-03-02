resource "aws_shield_protection_health_check_association" "shield_protection_health_check_associations" {
  for_each = var.shield_protection_health_check_associations

  health_check_arn     = each.value.health_check_arn
  shield_protection_id = each.value.shield_protection_id
}
