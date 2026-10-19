resource "aws_s3_bucket_public_access_block" "s3_bucket_public_access_blocks" {
  for_each = var.s3_bucket_public_access_blocks

  bucket                  = each.value.bucket
  block_public_acls       = each.value.block_public_acls
  block_public_policy     = each.value.block_public_policy
  ignore_public_acls      = each.value.ignore_public_acls
  region                  = each.value.region
  restrict_public_buckets = each.value.restrict_public_buckets
  skip_destroy            = each.value.skip_destroy
}
