resource "aws_shield_drt_access_log_bucket_association" "shield_drt_access_log_bucket_associations" {
  for_each = var.shield_drt_access_log_bucket_associations

  log_bucket              = each.value.log_bucket
  role_arn_association_id = each.value.role_arn_association_id
}
