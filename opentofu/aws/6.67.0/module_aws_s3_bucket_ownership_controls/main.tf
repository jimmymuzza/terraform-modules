resource "aws_s3_bucket_ownership_controls" "s3_bucket_ownership_controls" {
  for_each = var.s3_bucket_ownership_controls

  bucket = each.value.bucket
  region = each.value.region

  dynamic "rule" {
    for_each = each.value.rule != null ? each.value.rule : []
    content {
      object_ownership = rule.value.object_ownership
    }
  }
}
