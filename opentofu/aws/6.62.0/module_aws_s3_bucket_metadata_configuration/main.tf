resource "aws_s3_bucket_metadata_configuration" "s3_bucket_metadata_configurations" {
  for_each = var.s3_bucket_metadata_configurations

  bucket                = each.value.bucket
  expected_bucket_owner = each.value.expected_bucket_owner
  region                = each.value.region

  dynamic "metadata_configuration" {
    for_each = each.value.metadata_configuration != null ? each.value.metadata_configuration : []
    content {

      dynamic "inventory_table_configuration" {
        for_each = metadata_configuration.value.inventory_table_configuration != null ? metadata_configuration.value.inventory_table_configuration : []
        content {
          configuration_state = inventory_table_configuration.value.configuration_state

          dynamic "encryption_configuration" {
            for_each = inventory_table_configuration.value.encryption_configuration != null ? inventory_table_configuration.value.encryption_configuration : []
            content {
              sse_algorithm = encryption_configuration.value.sse_algorithm
              kms_key_arn   = encryption_configuration.value.kms_key_arn
            }
          }
        }
      }

      dynamic "journal_table_configuration" {
        for_each = metadata_configuration.value.journal_table_configuration != null ? metadata_configuration.value.journal_table_configuration : []
        content {

          dynamic "encryption_configuration" {
            for_each = journal_table_configuration.value.encryption_configuration != null ? journal_table_configuration.value.encryption_configuration : []
            content {
              sse_algorithm = encryption_configuration.value.sse_algorithm
              kms_key_arn   = encryption_configuration.value.kms_key_arn
            }
          }

          dynamic "record_expiration" {
            for_each = journal_table_configuration.value.record_expiration != null ? journal_table_configuration.value.record_expiration : []
            content {
              expiration = record_expiration.value.expiration
              days       = record_expiration.value.days
            }
          }
        }
      }
    }
  }
}
