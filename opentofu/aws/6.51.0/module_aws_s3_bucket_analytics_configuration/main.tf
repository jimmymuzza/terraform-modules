resource "aws_s3_bucket_analytics_configuration" "s3_bucket_analytics_configurations" {
  for_each = var.s3_bucket_analytics_configurations

  bucket = each.value.bucket
  name   = each.value.name
  region = each.value.region

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      prefix = filter.value.prefix
      tags   = filter.value.tags
    }
  }

  dynamic "storage_class_analysis" {
    for_each = each.value.storage_class_analysis != null ? each.value.storage_class_analysis : []
    content {

      dynamic "data_export" {
        for_each = storage_class_analysis.value.data_export != null ? storage_class_analysis.value.data_export : []
        content {
          output_schema_version = data_export.value.output_schema_version

          dynamic "destination" {
            for_each = data_export.value.destination != null ? data_export.value.destination : []
            content {

              dynamic "s3_bucket_destination" {
                for_each = destination.value.s3_bucket_destination != null ? destination.value.s3_bucket_destination : []
                content {
                  bucket_arn        = s3_bucket_destination.value.bucket_arn
                  bucket_account_id = s3_bucket_destination.value.bucket_account_id
                  format            = s3_bucket_destination.value.format
                  prefix            = s3_bucket_destination.value.prefix
                }
              }
            }
          }
        }
      }
    }
  }
}
