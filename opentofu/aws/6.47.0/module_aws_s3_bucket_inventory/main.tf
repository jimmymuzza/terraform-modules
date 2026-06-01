resource "aws_s3_bucket_inventory" "s3_bucket_inventories" {
  for_each = var.s3_bucket_inventories

  bucket                   = each.value.bucket
  included_object_versions = each.value.included_object_versions
  name                     = each.value.name
  enabled                  = each.value.enabled
  optional_fields          = each.value.optional_fields
  region                   = each.value.region

  dynamic "destination" {
    for_each = each.value.destination != null ? each.value.destination : []
    content {

      dynamic "bucket" {
        for_each = destination.value.bucket != null ? destination.value.bucket : []
        content {
          bucket_arn = bucket.value.bucket_arn
          format     = bucket.value.format
          account_id = bucket.value.account_id
          prefix     = bucket.value.prefix

          dynamic "encryption" {
            for_each = bucket.value.encryption != null ? bucket.value.encryption : []
            content {

              dynamic "sse_kms" {
                for_each = encryption.value.sse_kms != null ? encryption.value.sse_kms : []
                content {
                  key_id = sse_kms.value.key_id
                }
              }

              dynamic "sse_s3" {
                for_each = encryption.value.sse_s3 != null ? encryption.value.sse_s3 : []
                content {
                }
              }
            }
          }
        }
      }
    }
  }

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      prefix = filter.value.prefix
    }
  }

  dynamic "schedule" {
    for_each = each.value.schedule != null ? each.value.schedule : []
    content {
      frequency = schedule.value.frequency
    }
  }
}
