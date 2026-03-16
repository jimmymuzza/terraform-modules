resource "aws_s3_account_public_access_block" "s3_account_public_access_blocks" {
  for_each = var.s3_account_public_access_blocks

  account_id              = each.value.account_id
  block_public_acls       = each.value.block_public_acls
  block_public_policy     = each.value.block_public_policy
  ignore_public_acls      = each.value.ignore_public_acls
  restrict_public_buckets = each.value.restrict_public_buckets
}
