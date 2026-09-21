resource "aws_s3_bucket_policy" "s3_bucket_policies" {
  for_each = var.s3_bucket_policies

  bucket = each.value.bucket
  policy = each.value.policy
  region = each.value.region
}
