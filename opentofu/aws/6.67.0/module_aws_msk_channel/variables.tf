variable "msk_channels" {
  description = <<EOT
Map of msk_channels, attributes below
Required:
    - channel_name
    - cluster_arn
Optional:
    - region
    - tags
    - encryption_configuration
    - iceberg_destination
    - logging_info
    - s3_destination
    - topic_configuration
EOT

  type = map(object({
    channel_name             = string
    cluster_arn              = string
    region                   = optional(string)
    tags                     = optional(map(string))
    encryption_configuration = optional(list(object({
            kms_key_arn = string
        })))
    iceberg_destination      = optional(list(object({
            append_only                = bool
            service_execution_role_arn = string
            compression_type           = optional(string)
            data_freshness_in_seconds  = optional(number)
            catalog                    = optional(list(object({
                catalog_arn        = optional(string)
                warehouse_location = optional(string)
            })))
            dead_letter_queue_s3       = optional(list(object({
                bucket_arn            = string
                error_output_prefix   = optional(string)
                expected_bucket_owner = optional(string)
            })))
            destination_table          = optional(list(object({
                destination_database_name = optional(string)
                destination_table_name    = optional(string)
                partition_spec            = optional(list(object({
                    partition_strategy = string
                    source             = optional(list(object({
                        source_name = optional(string)
                    })))
                })))
            })))
            schema_evolution           = optional(list(object({
                enable_schema_evolution = optional(bool)
            })))
            table_creation             = optional(list(object({
                enable_table_creation = optional(bool)
            })))
        })))
    logging_info             = optional(list(object({
            cloudwatch_logs = optional(list(object({
                enabled   = bool
                log_group = optional(string)
            })))
            firehose        = optional(list(object({
                enabled         = bool
                delivery_stream = optional(string)
            })))
            s3              = optional(list(object({
                enabled = bool
                bucket  = optional(string)
                prefix  = optional(string)
            })))
        })))
    s3_destination           = optional(list(object({
            service_execution_role_arn = string
            data_freshness_in_seconds  = optional(number)
            dead_letter_queue_s3       = optional(list(object({
                bucket_arn            = string
                error_output_prefix   = optional(string)
                expected_bucket_owner = optional(string)
            })))
            storage                    = optional(list(object({
                bucket_arn            = string
                compression_type      = string
                storage_class         = string
                expected_bucket_owner = optional(string)
                output_key_template   = optional(string)
                output_prefix         = optional(string)
            })))
        })))
    topic_configuration      = optional(list(object({
            topic_arn        = string
            record_converter = optional(list(object({
                value_converter = string
            })))
            record_schema    = optional(list(object({
                gsr_arn = string
            })))
        })))
  }))
}
