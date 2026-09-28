resource "aws_s3_access_point" "s3_access_points" {
  for_each = var.s3_access_points

  bucket            = each.value.bucket
  name              = each.value.name
  account_id        = each.value.account_id
  bucket_account_id = each.value.bucket_account_id
  policy            = each.value.policy
  region            = each.value.region
  tags              = each.value.tags
  tags_all          = each.value.tags_all

  dynamic "public_access_block_configuration" {
    for_each = each.value.public_access_block_configuration != null ? each.value.public_access_block_configuration : []
    content {
      block_public_acls       = public_access_block_configuration.value.block_public_acls
      block_public_policy     = public_access_block_configuration.value.block_public_policy
      ignore_public_acls      = public_access_block_configuration.value.ignore_public_acls
      restrict_public_buckets = public_access_block_configuration.value.restrict_public_buckets
    }
  }

  dynamic "vpc_configuration" {
    for_each = each.value.vpc_configuration != null ? each.value.vpc_configuration : []
    content {
      vpc_id = vpc_configuration.value.vpc_id
    }
  }
}
