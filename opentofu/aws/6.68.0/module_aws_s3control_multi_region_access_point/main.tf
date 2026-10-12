resource "aws_s3control_multi_region_access_point" "s3control_multi_region_access_points" {
  for_each = var.s3control_multi_region_access_points

  account_id = each.value.account_id
  region     = each.value.region

  dynamic "details" {
    for_each = each.value.details != null ? each.value.details : []
    content {
      name = details.value.name

      dynamic "public_access_block" {
        for_each = details.value.public_access_block != null ? details.value.public_access_block : []
        content {
          block_public_acls       = public_access_block.value.block_public_acls
          block_public_policy     = public_access_block.value.block_public_policy
          ignore_public_acls      = public_access_block.value.ignore_public_acls
          restrict_public_buckets = public_access_block.value.restrict_public_buckets
        }
      }

      dynamic "region" {
        for_each = details.value.region != null ? details.value.region : []
        content {
          bucket            = region.value.bucket
          bucket_account_id = region.value.bucket_account_id
        }
      }
    }
  }
}
