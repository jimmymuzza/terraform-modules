resource "aws_msk_channel" "msk_channels" {
  for_each = var.msk_channels

  channel_name = each.value.channel_name
  cluster_arn  = each.value.cluster_arn
  region       = each.value.region
  tags         = each.value.tags

  dynamic "encryption_configuration" {
    for_each = each.value.encryption_configuration != null ? each.value.encryption_configuration : []
    content {
      kms_key_arn = encryption_configuration.value.kms_key_arn
    }
  }

  dynamic "iceberg_destination" {
    for_each = each.value.iceberg_destination != null ? each.value.iceberg_destination : []
    content {
      append_only                = iceberg_destination.value.append_only
      service_execution_role_arn = iceberg_destination.value.service_execution_role_arn
      compression_type           = iceberg_destination.value.compression_type
      data_freshness_in_seconds  = iceberg_destination.value.data_freshness_in_seconds

      dynamic "catalog" {
        for_each = iceberg_destination.value.catalog != null ? iceberg_destination.value.catalog : []
        content {
          catalog_arn        = catalog.value.catalog_arn
          warehouse_location = catalog.value.warehouse_location
        }
      }

      dynamic "dead_letter_queue_s3" {
        for_each = iceberg_destination.value.dead_letter_queue_s3 != null ? iceberg_destination.value.dead_letter_queue_s3 : []
        content {
          bucket_arn            = dead_letter_queue_s3.value.bucket_arn
          error_output_prefix   = dead_letter_queue_s3.value.error_output_prefix
          expected_bucket_owner = dead_letter_queue_s3.value.expected_bucket_owner
        }
      }

      dynamic "destination_table" {
        for_each = iceberg_destination.value.destination_table != null ? iceberg_destination.value.destination_table : []
        content {
          destination_database_name = destination_table.value.destination_database_name
          destination_table_name    = destination_table.value.destination_table_name

          dynamic "partition_spec" {
            for_each = destination_table.value.partition_spec != null ? destination_table.value.partition_spec : []
            content {
              partition_strategy = partition_spec.value.partition_strategy

              dynamic "source" {
                for_each = partition_spec.value.source != null ? partition_spec.value.source : []
                content {
                  source_name = source.value.source_name
                }
              }
            }
          }
        }
      }

      dynamic "schema_evolution" {
        for_each = iceberg_destination.value.schema_evolution != null ? iceberg_destination.value.schema_evolution : []
        content {
          enable_schema_evolution = schema_evolution.value.enable_schema_evolution
        }
      }

      dynamic "table_creation" {
        for_each = iceberg_destination.value.table_creation != null ? iceberg_destination.value.table_creation : []
        content {
          enable_table_creation = table_creation.value.enable_table_creation
        }
      }
    }
  }

  dynamic "logging_info" {
    for_each = each.value.logging_info != null ? each.value.logging_info : []
    content {

      dynamic "cloudwatch_logs" {
        for_each = logging_info.value.cloudwatch_logs != null ? logging_info.value.cloudwatch_logs : []
        content {
          enabled   = cloudwatch_logs.value.enabled
          log_group = cloudwatch_logs.value.log_group
        }
      }

      dynamic "firehose" {
        for_each = logging_info.value.firehose != null ? logging_info.value.firehose : []
        content {
          enabled         = firehose.value.enabled
          delivery_stream = firehose.value.delivery_stream
        }
      }

      dynamic "s3" {
        for_each = logging_info.value.s3 != null ? logging_info.value.s3 : []
        content {
          enabled = s3.value.enabled
          bucket  = s3.value.bucket
          prefix  = s3.value.prefix
        }
      }
    }
  }

  dynamic "s3_destination" {
    for_each = each.value.s3_destination != null ? each.value.s3_destination : []
    content {
      service_execution_role_arn = s3_destination.value.service_execution_role_arn
      data_freshness_in_seconds  = s3_destination.value.data_freshness_in_seconds

      dynamic "dead_letter_queue_s3" {
        for_each = s3_destination.value.dead_letter_queue_s3 != null ? s3_destination.value.dead_letter_queue_s3 : []
        content {
          bucket_arn            = dead_letter_queue_s3.value.bucket_arn
          error_output_prefix   = dead_letter_queue_s3.value.error_output_prefix
          expected_bucket_owner = dead_letter_queue_s3.value.expected_bucket_owner
        }
      }

      dynamic "storage" {
        for_each = s3_destination.value.storage != null ? s3_destination.value.storage : []
        content {
          bucket_arn            = storage.value.bucket_arn
          compression_type      = storage.value.compression_type
          storage_class         = storage.value.storage_class
          expected_bucket_owner = storage.value.expected_bucket_owner
          output_key_template   = storage.value.output_key_template
          output_prefix         = storage.value.output_prefix
        }
      }
    }
  }

  dynamic "topic_configuration" {
    for_each = each.value.topic_configuration != null ? each.value.topic_configuration : []
    content {
      topic_arn = topic_configuration.value.topic_arn

      dynamic "record_converter" {
        for_each = topic_configuration.value.record_converter != null ? topic_configuration.value.record_converter : []
        content {
          value_converter = record_converter.value.value_converter
        }
      }

      dynamic "record_schema" {
        for_each = topic_configuration.value.record_schema != null ? topic_configuration.value.record_schema : []
        content {
          gsr_arn = record_schema.value.gsr_arn
        }
      }
    }
  }
}
