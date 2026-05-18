resource "aws_appfabric_ingestion_destination" "appfabric_ingestion_destinations" {
  for_each = var.appfabric_ingestion_destinations

  app_bundle_arn = each.value.app_bundle_arn
  ingestion_arn  = each.value.ingestion_arn
  region         = each.value.region
  tags           = each.value.tags

  dynamic "destination_configuration" {
    for_each = each.value.destination_configuration != null ? each.value.destination_configuration : []
    content {

      dynamic "audit_log" {
        for_each = destination_configuration.value.audit_log != null ? destination_configuration.value.audit_log : []
        content {

          dynamic "destination" {
            for_each = audit_log.value.destination != null ? audit_log.value.destination : []
            content {

              dynamic "firehose_stream" {
                for_each = destination.value.firehose_stream != null ? destination.value.firehose_stream : []
                content {
                  stream_name = firehose_stream.value.stream_name
                }
              }

              dynamic "s3_bucket" {
                for_each = destination.value.s3_bucket != null ? destination.value.s3_bucket : []
                content {
                  bucket_name = s3_bucket.value.bucket_name
                  prefix      = s3_bucket.value.prefix
                }
              }
            }
          }
        }
      }
    }
  }

  dynamic "processing_configuration" {
    for_each = each.value.processing_configuration != null ? each.value.processing_configuration : []
    content {

      dynamic "audit_log" {
        for_each = processing_configuration.value.audit_log != null ? processing_configuration.value.audit_log : []
        content {
          format = audit_log.value.format
          schema = audit_log.value.schema
        }
      }
    }
  }
}
