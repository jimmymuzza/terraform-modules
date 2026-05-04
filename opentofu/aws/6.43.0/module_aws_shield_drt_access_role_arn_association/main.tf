resource "aws_shield_drt_access_role_arn_association" "shield_drt_access_role_arn_associations" {
  for_each = var.shield_drt_access_role_arn_associations

  role_arn = each.value.role_arn
}
