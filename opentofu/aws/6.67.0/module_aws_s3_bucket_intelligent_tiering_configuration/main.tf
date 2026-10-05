resource "aws_s3_bucket_intelligent_tiering_configuration" "s3_bucket_intelligent_tiering_configurations" {
  for_each = var.s3_bucket_intelligent_tiering_configurations

  bucket = each.value.bucket
  name   = each.value.name
  region = each.value.region
  status = each.value.status

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      prefix = filter.value.prefix
      tags   = filter.value.tags
    }
  }

  dynamic "tiering" {
    for_each = each.value.tiering != null ? each.value.tiering : []
    content {
      access_tier = tiering.value.access_tier
      days        = tiering.value.days
    }
  }
}
