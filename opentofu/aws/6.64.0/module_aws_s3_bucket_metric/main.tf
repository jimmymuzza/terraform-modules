resource "aws_s3_bucket_metric" "s3_bucket_metrics" {
  for_each = var.s3_bucket_metrics

  bucket = each.value.bucket
  name   = each.value.name
  region = each.value.region

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      access_point = filter.value.access_point
      prefix       = filter.value.prefix
      tags         = filter.value.tags
    }
  }
}
