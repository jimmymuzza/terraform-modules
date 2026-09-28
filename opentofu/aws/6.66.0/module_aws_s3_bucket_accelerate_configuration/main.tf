resource "aws_s3_bucket_accelerate_configuration" "s3_bucket_accelerate_configurations" {
  for_each = var.s3_bucket_accelerate_configurations

  bucket                = each.value.bucket
  status                = each.value.status
  expected_bucket_owner = each.value.expected_bucket_owner
  region                = each.value.region
}
