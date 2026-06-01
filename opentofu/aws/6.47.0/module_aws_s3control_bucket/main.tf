resource "aws_s3control_bucket" "s3control_buckets" {
  for_each = var.s3control_buckets

  bucket     = each.value.bucket
  outpost_id = each.value.outpost_id
  region     = each.value.region
  tags       = each.value.tags
  tags_all   = each.value.tags_all
}
