variable "timestreamquery_scheduled_queries" {
  description = <<EOT
Map of timestreamquery_scheduled_queries, attributes below
Required:
    - execution_role_arn
    - name
    - query_string
Optional:
    - kms_key_id
    - region
    - tags
    - error_report_configuration
    - last_run_summary
    - notification_configuration
    - recently_failed_runs
    - schedule_configuration
    - target_configuration
EOT

  type = map(object({
    execution_role_arn         = string
    name                       = string
    query_string               = string
    kms_key_id                 = optional(string)
    region                     = optional(string)
    tags                       = optional(map(string))
    error_report_configuration = optional(list(object({
            s3_configuration = optional(list(object({
                bucket_name       = string
                encryption_option = optional(string)
                object_key_prefix = optional(string)
            })))
        })))
    last_run_summary           = optional(list(object({
            error_report_location   = optional(list(object({
                s3_report_location = optional(list(object({

                })))
            })))
            execution_stats         = optional(list(object({

            })))
            query_insights_response = optional(list(object({
                query_spatial_coverage = optional(list(object({
                    max = optional(list(object({

                    })))
                })))
                query_temporal_range   = optional(list(object({
                    max = optional(list(object({

                    })))
                })))
            })))
        })))
    notification_configuration = optional(list(object({
            sns_configuration = optional(list(object({
                topic_arn = string
            })))
        })))
    recently_failed_runs       = optional(list(object({
            error_report_location   = optional(list(object({
                s3_report_location = optional(list(object({

                })))
            })))
            execution_stats         = optional(list(object({

            })))
            query_insights_response = optional(list(object({
                query_spatial_coverage = optional(list(object({
                    max = optional(list(object({

                    })))
                })))
                query_temporal_range   = optional(list(object({
                    max = optional(list(object({

                    })))
                })))
            })))
        })))
    schedule_configuration     = optional(list(object({
            schedule_expression = string
        })))
    target_configuration       = optional(list(object({
            timestream_configuration = optional(list(object({
                database_name          = string
                table_name             = string
                time_column            = string
                measure_name_column    = optional(string)
                dimension_mapping      = optional(list(object({
                    dimension_value_type = string
                    name                 = string
                })))
                mixed_measure_mapping  = optional(list(object({
                    measure_value_type              = string
                    measure_name                    = optional(string)
                    source_column                   = optional(string)
                    target_measure_name             = optional(string)
                    multi_measure_attribute_mapping = optional(list(object({
                        measure_value_type                  = string
                        source_column                       = string
                        target_multi_measure_attribute_name = optional(string)
                    })))
                })))
                multi_measure_mappings = optional(list(object({
                    target_multi_measure_name       = optional(string)
                    multi_measure_attribute_mapping = optional(list(object({
                        measure_value_type                  = string
                        source_column                       = string
                        target_multi_measure_attribute_name = optional(string)
                    })))
                })))
            })))
        })))
  }))
}
