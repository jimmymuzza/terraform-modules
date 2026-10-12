resource "aws_s3control_bucket_policy" "s3control_bucket_policies" {
  for_each = var.s3control_bucket_policies

  bucket = each.value.bucket
  policy = each.value.policy
  region = each.value.region
}
