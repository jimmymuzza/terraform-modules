variable "kinesisanalyticsv2_applications" {
  description = <<EOT
Map of kinesisanalyticsv2_applications, attributes below
Required:
    - name
    - runtime_environment
    - service_execution_role
Optional:
    - application_mode
    - description
    - force_stop
    - region
    - start_application
    - tags
    - tags_all
    - application_configuration
    - cloudwatch_logging_options
EOT

  type = map(object({
    name                       = string
    runtime_environment        = string
    service_execution_role     = string
    application_mode           = optional(string)
    description                = optional(string)
    force_stop                 = optional(bool)
    region                     = optional(string)
    start_application          = optional(bool)
    tags                       = optional(map(string))
    tags_all                   = optional(map(string))
    application_configuration  = optional(list(object({
            application_code_configuration       = list(object({
                code_content_type = string
                code_content      = optional(list(object({
                    text_content        = optional(string)
                    s3_content_location = optional(list(object({
                        bucket_arn     = string
                        file_key       = string
                        object_version = optional(string)
                    })))
                })))
            }))
            application_encryption_configuration = optional(list(object({
                key_type = string
                key_id   = optional(string)
            })))
            application_snapshot_configuration   = optional(list(object({
                snapshots_enabled = bool
            })))
            environment_properties               = optional(list(object({
                property_group = set(object({
                    property_group_id = string
                    property_map      = map(string)
                }))
            })))
            flink_application_configuration      = optional(list(object({
                checkpoint_configuration  = optional(list(object({
                    configuration_type            = string
                    checkpoint_interval           = optional(number)
                    checkpointing_enabled         = optional(bool)
                    min_pause_between_checkpoints = optional(number)
                })))
                monitoring_configuration  = optional(list(object({
                    configuration_type = string
                    log_level          = optional(string)
                    metrics_level      = optional(string)
                })))
                parallelism_configuration = optional(list(object({
                    configuration_type   = string
                    auto_scaling_enabled = optional(bool)
                    parallelism          = optional(number)
                    parallelism_per_kpu  = optional(number)
                })))
            })))
            run_configuration                    = optional(list(object({
                application_restore_configuration = optional(list(object({
                    application_restore_type = optional(string)
                    snapshot_name            = optional(string)
                })))
                flink_run_configuration           = optional(list(object({
                    allow_non_restored_state = optional(bool)
                })))
            })))
            sql_application_configuration        = optional(list(object({
                input                 = optional(list(object({
                    name_prefix                           = string
                    input_parallelism                     = optional(list(object({
                        count = optional(number)
                    })))
                    input_processing_configuration        = optional(list(object({
                        input_lambda_processor = list(object({
                            resource_arn = string
                        }))
                    })))
                    input_schema                          = list(object({
                        record_encoding = optional(string)
                        record_column   = list(object({
                            name     = string
                            sql_type = string
                            mapping  = optional(string)
                        }))
                        record_format   = list(object({
                            record_format_type = string
                            mapping_parameters = list(object({
                                csv_mapping_parameters  = optional(list(object({
                                    record_column_delimiter = string
                                    record_row_delimiter    = string
                                })))
                                json_mapping_parameters = optional(list(object({
                                    record_row_path = string
                                })))
                            }))
                        }))
                    }))
                    input_starting_position_configuration = optional(list(object({
                        input_starting_position = optional(string)
                    })))
                    kinesis_firehose_input                = optional(list(object({
                        resource_arn = string
                    })))
                    kinesis_streams_input                 = optional(list(object({
                        resource_arn = string
                    })))
                })))
                output                = optional(set(object({
                    name                    = string
                    destination_schema      = list(object({
                        record_format_type = string
                    }))
                    kinesis_firehose_output = optional(list(object({
                        resource_arn = string
                    })))
                    kinesis_streams_output  = optional(list(object({
                        resource_arn = string
                    })))
                    lambda_output           = optional(list(object({
                        resource_arn = string
                    })))
                })))
                reference_data_source = optional(list(object({
                    table_name               = string
                    reference_schema         = list(object({
                        record_encoding = optional(string)
                        record_column   = list(object({
                            name     = string
                            sql_type = string
                            mapping  = optional(string)
                        }))
                        record_format   = list(object({
                            record_format_type = string
                            mapping_parameters = list(object({
                                csv_mapping_parameters  = optional(list(object({
                                    record_column_delimiter = string
                                    record_row_delimiter    = string
                                })))
                                json_mapping_parameters = optional(list(object({
                                    record_row_path = string
                                })))
                            }))
                        }))
                    }))
                    s3_reference_data_source = list(object({
                        bucket_arn = string
                        file_key   = string
                    }))
                })))
            })))
            vpc_configuration                    = optional(list(object({
                security_group_ids = set(string)
                subnet_ids         = set(string)
            })))
        })))
    cloudwatch_logging_options = optional(list(object({
            log_stream_arn = string
        })))
  }))
}
