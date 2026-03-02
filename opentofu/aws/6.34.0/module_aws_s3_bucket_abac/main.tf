resource "aws_s3_bucket_abac" "s3_bucket_abacs" {
  for_each = var.s3_bucket_abacs

  bucket                = each.value.bucket
  expected_bucket_owner = each.value.expected_bucket_owner
  region                = each.value.region

  dynamic "abac_status" {
    for_each = each.value.abac_status != null ? each.value.abac_status : []
    content {
      status = abac_status.value.status
    }
  }
}
