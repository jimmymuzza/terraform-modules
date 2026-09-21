variable "kinesis_analytics_applications" {
  description = <<EOT
Map of kinesis_analytics_applications, attributes below
Required:
    - name
Optional:
    - code
    - description
    - region
    - start_application
    - tags
    - tags_all
    - cloudwatch_logging_options
    - inputs
    - outputs
    - reference_data_sources
EOT

  type = map(object({
    name                       = string
    code                       = optional(string)
    description                = optional(string)
    region                     = optional(string)
    start_application          = optional(bool)
    tags                       = optional(map(string))
    tags_all                   = optional(map(string))
    cloudwatch_logging_options = optional(list(object({
            log_stream_arn = string
            role_arn       = string
        })))
    inputs                     = optional(list(object({
            name_prefix                     = string
            kinesis_firehose                = optional(list(object({
                resource_arn = string
                role_arn     = string
            })))
            kinesis_stream                  = optional(list(object({
                resource_arn = string
                role_arn     = string
            })))
            parallelism                     = optional(list(object({
                count = optional(number)
            })))
            processing_configuration        = optional(list(object({
                lambda = list(object({
                    resource_arn = string
                    role_arn     = string
                }))
            })))
            schema                          = list(object({
                record_encoding = optional(string)
                record_columns  = list(object({
                    name     = string
                    sql_type = string
                    mapping  = optional(string)
                }))
                record_format   = list(object({
                    mapping_parameters = optional(list(object({
                        csv  = optional(list(object({
                            record_column_delimiter = string
                            record_row_delimiter    = string
                        })))
                        json = optional(list(object({
                            record_row_path = string
                        })))
                    })))
                }))
            }))
            starting_position_configuration = optional(list(object({
                starting_position = optional(string)
            })))
        })))
    outputs                    = optional(set(object({
            name             = string
            kinesis_firehose = optional(list(object({
                resource_arn = string
                role_arn     = string
            })))
            kinesis_stream   = optional(list(object({
                resource_arn = string
                role_arn     = string
            })))
            lambda           = optional(list(object({
                resource_arn = string
                role_arn     = string
            })))
            schema           = list(object({
                record_format_type = string
            }))
        })))
    reference_data_sources     = optional(list(object({
            table_name = string
            s3         = list(object({
                bucket_arn = string
                file_key   = string
                role_arn   = string
            }))
            schema     = list(object({
                record_encoding = optional(string)
                record_columns  = list(object({
                    name     = string
                    sql_type = string
                    mapping  = optional(string)
                }))
                record_format   = list(object({
                    mapping_parameters = optional(list(object({
                        csv  = optional(list(object({
                            record_column_delimiter = string
                            record_row_delimiter    = string
                        })))
                        json = optional(list(object({
                            record_row_path = string
                        })))
                    })))
                }))
            }))
        })))
  }))
}
