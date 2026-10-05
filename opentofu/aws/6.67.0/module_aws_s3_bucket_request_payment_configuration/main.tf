resource "aws_s3_bucket_request_payment_configuration" "s3_bucket_request_payment_configurations" {
  for_each = var.s3_bucket_request_payment_configurations

  bucket                = each.value.bucket
  payer                 = each.value.payer
  expected_bucket_owner = each.value.expected_bucket_owner
  region                = each.value.region
}
