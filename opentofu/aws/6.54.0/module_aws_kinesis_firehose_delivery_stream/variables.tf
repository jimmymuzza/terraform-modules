variable "kinesis_firehose_delivery_streams" {
  description = <<EOT
Map of kinesis_firehose_delivery_streams, attributes below
Required:
    - destination
    - name
Optional:
    - arn
    - destination_id
    - region
    - tags
    - tags_all
    - version_id
    - elasticsearch_configuration
    - extended_s3_configuration
    - http_endpoint_configuration
    - iceberg_configuration
    - kinesis_source_configuration
    - msk_source_configuration
    - opensearch_configuration
    - opensearchserverless_configuration
    - redshift_configuration
    - server_side_encryption
    - snowflake_configuration
    - splunk_configuration
EOT

  type = map(object({
    destination                        = string
    name                               = string
    arn                                = optional(string)
    destination_id                     = optional(string)
    region                             = optional(string)
    tags                               = optional(map(string))
    tags_all                           = optional(map(string))
    version_id                         = optional(string)
    elasticsearch_configuration        = optional(list(object({
            index_name                 = string
            role_arn                   = string
            buffering_interval         = optional(number)
            buffering_size             = optional(number)
            cluster_endpoint           = optional(string)
            domain_arn                 = optional(string)
            index_rotation_period      = optional(string)
            retry_duration             = optional(number)
            s3_backup_mode             = optional(string)
            type_name                  = optional(string)
            cloudwatch_logging_options = optional(list(object({
                enabled         = optional(bool)
                log_group_name  = optional(string)
                log_stream_name = optional(string)
            })))
            processing_configuration   = optional(list(object({
                enabled    = optional(bool)
                processors = optional(list(object({
                    type       = string
                    parameters = optional(set(object({
                        parameter_name  = string
                        parameter_value = string
                    })))
                })))
            })))
            s3_configuration           = list(object({
                bucket_arn                 = string
                role_arn                   = string
                buffering_interval         = optional(number)
                buffering_size             = optional(number)
                compression_format         = optional(string)
                error_output_prefix        = optional(string)
                kms_key_arn                = optional(string)
                prefix                     = optional(string)
                cloudwatch_logging_options = optional(list(object({
                    enabled         = optional(bool)
                    log_group_name  = optional(string)
                    log_stream_name = optional(string)
                })))
            }))
            vpc_config                 = optional(list(object({
                role_arn           = string
                security_group_ids = set(string)
                subnet_ids         = set(string)
            })))
        })))
    extended_s3_configuration          = optional(list(object({
            bucket_arn                           = string
            role_arn                             = string
            buffering_interval                   = optional(number)
            buffering_size                       = optional(number)
            compression_format                   = optional(string)
            custom_time_zone                     = optional(string)
            error_output_prefix                  = optional(string)
            file_extension                       = optional(string)
            kms_key_arn                          = optional(string)
            prefix                               = optional(string)
            s3_backup_mode                       = optional(string)
            cloudwatch_logging_options           = optional(list(object({
                enabled         = optional(bool)
                log_group_name  = optional(string)
                log_stream_name = optional(string)
            })))
            data_format_conversion_configuration = optional(list(object({
                enabled                     = optional(bool)
                input_format_configuration  = list(object({
                    deserializer = list(object({
                        hive_json_ser_de   = optional(list(object({
                            timestamp_formats = optional(list(string))
                        })))
                        open_x_json_ser_de = optional(list(object({
                            case_insensitive                         = optional(bool)
                            column_to_json_key_mappings              = optional(map(string))
                            convert_dots_in_json_keys_to_underscores = optional(bool)
                        })))
                    }))
                }))
                output_format_configuration = list(object({
                    serializer = list(object({
                        orc_ser_de     = optional(list(object({
                            block_size_bytes                        = optional(number)
                            bloom_filter_columns                    = optional(list(string))
                            bloom_filter_false_positive_probability = optional(number)
                            compression                             = optional(string)
                            dictionary_key_threshold                = optional(number)
                            enable_padding                          = optional(bool)
                            format_version                          = optional(string)
                            padding_tolerance                       = optional(number)
                            row_index_stride                        = optional(number)
                            stripe_size_bytes                       = optional(number)
                        })))
                        parquet_ser_de = optional(list(object({
                            block_size_bytes              = optional(number)
                            compression                   = optional(string)
                            enable_dictionary_compression = optional(bool)
                            max_padding_bytes             = optional(number)
                            page_size_bytes               = optional(number)
                            writer_version                = optional(string)
                        })))
                    }))
                }))
                schema_configuration        = list(object({
                    database_name = string
                    role_arn      = string
                    table_name    = string
                    catalog_id    = optional(string)
                    region        = optional(string)
                    version_id    = optional(string)
                }))
            })))
            dynamic_partitioning_configuration   = optional(list(object({
                enabled        = optional(bool)
                retry_duration = optional(number)
            })))
            processing_configuration             = optional(list(object({
                enabled    = optional(bool)
                processors = optional(list(object({
                    type       = string
                    parameters = optional(set(object({
                        parameter_name  = string
                        parameter_value = string
                    })))
                })))
            })))
            s3_backup_configuration              = optional(list(object({
                bucket_arn                 = string
                role_arn                   = string
                buffering_interval         = optional(number)
                buffering_size             = optional(number)
                compression_format         = optional(string)
                error_output_prefix        = optional(string)
                kms_key_arn                = optional(string)
                prefix                     = optional(string)
                cloudwatch_logging_options = optional(list(object({
                    enabled         = optional(bool)
                    log_group_name  = optional(string)
                    log_stream_name = optional(string)
                })))
            })))
        })))
    http_endpoint_configuration        = optional(list(object({
            url                           = string
            access_key                    = optional(string)
            buffering_interval            = optional(number)
            buffering_size                = optional(number)
            name                          = optional(string)
            retry_duration                = optional(number)
            role_arn                      = optional(string)
            s3_backup_mode                = optional(string)
            cloudwatch_logging_options    = optional(list(object({
                enabled         = optional(bool)
                log_group_name  = optional(string)
                log_stream_name = optional(string)
            })))
            processing_configuration      = optional(list(object({
                enabled    = optional(bool)
                processors = optional(list(object({
                    type       = string
                    parameters = optional(set(object({
                        parameter_name  = string
                        parameter_value = string
                    })))
                })))
            })))
            request_configuration         = optional(list(object({
                content_encoding  = optional(string)
                common_attributes = optional(list(object({
                    name  = string
                    value = string
                })))
            })))
            s3_configuration              = list(object({
                bucket_arn                 = string
                role_arn                   = string
                buffering_interval         = optional(number)
                buffering_size             = optional(number)
                compression_format         = optional(string)
                error_output_prefix        = optional(string)
                kms_key_arn                = optional(string)
                prefix                     = optional(string)
                cloudwatch_logging_options = optional(list(object({
                    enabled         = optional(bool)
                    log_group_name  = optional(string)
                    log_stream_name = optional(string)
                })))
            }))
            secrets_manager_configuration = optional(list(object({
                enabled    = optional(bool)
                role_arn   = optional(string)
                secret_arn = optional(string)
            })))
        })))
    iceberg_configuration              = optional(list(object({
            catalog_arn                     = string
            role_arn                        = string
            append_only                     = optional(bool)
            buffering_interval              = optional(number)
            buffering_size                  = optional(number)
            retry_duration                  = optional(number)
            s3_backup_mode                  = optional(string)
            cloudwatch_logging_options      = optional(list(object({
                enabled         = optional(bool)
                log_group_name  = optional(string)
                log_stream_name = optional(string)
            })))
            destination_table_configuration = optional(list(object({
                database_name          = string
                table_name             = string
                s3_error_output_prefix = optional(string)
                unique_keys            = optional(list(string))
            })))
            processing_configuration        = optional(list(object({
                enabled    = optional(bool)
                processors = optional(list(object({
                    type       = string
                    parameters = optional(set(object({
                        parameter_name  = string
                        parameter_value = string
                    })))
                })))
            })))
            s3_configuration                = list(object({
                bucket_arn                 = string
                role_arn                   = string
                buffering_interval         = optional(number)
                buffering_size             = optional(number)
                compression_format         = optional(string)
                error_output_prefix        = optional(string)
                kms_key_arn                = optional(string)
                prefix                     = optional(string)
                cloudwatch_logging_options = optional(list(object({
                    enabled         = optional(bool)
                    log_group_name  = optional(string)
                    log_stream_name = optional(string)
                })))
            }))
        })))
    kinesis_source_configuration       = optional(list(object({
            kinesis_stream_arn = string
            role_arn           = string
        })))
    msk_source_configuration           = optional(list(object({
            msk_cluster_arn              = string
            topic_name                   = string
            read_from_timestamp          = optional(string)
            authentication_configuration = list(object({
                connectivity = string
                role_arn     = string
            }))
        })))
    opensearch_configuration           = optional(list(object({
            index_name                 = string
            role_arn                   = string
            buffering_interval         = optional(number)
            buffering_size             = optional(number)
            cluster_endpoint           = optional(string)
            domain_arn                 = optional(string)
            index_rotation_period      = optional(string)
            retry_duration             = optional(number)
            s3_backup_mode             = optional(string)
            type_name                  = optional(string)
            cloudwatch_logging_options = optional(list(object({
                enabled         = optional(bool)
                log_group_name  = optional(string)
                log_stream_name = optional(string)
            })))
            document_id_options        = optional(list(object({
                default_document_id_format = string
            })))
            processing_configuration   = optional(list(object({
                enabled    = optional(bool)
                processors = optional(list(object({
                    type       = string
                    parameters = optional(set(object({
                        parameter_name  = string
                        parameter_value = string
                    })))
                })))
            })))
            s3_configuration           = list(object({
                bucket_arn                 = string
                role_arn                   = string
                buffering_interval         = optional(number)
                buffering_size             = optional(number)
                compression_format         = optional(string)
                error_output_prefix        = optional(string)
                kms_key_arn                = optional(string)
                prefix                     = optional(string)
                cloudwatch_logging_options = optional(list(object({
                    enabled         = optional(bool)
                    log_group_name  = optional(string)
                    log_stream_name = optional(string)
                })))
            }))
            vpc_config                 = optional(list(object({
                role_arn           = string
                security_group_ids = set(string)
                subnet_ids         = set(string)
            })))
        })))
    opensearchserverless_configuration = optional(list(object({
            collection_endpoint        = string
            index_name                 = string
            role_arn                   = string
            buffering_interval         = optional(number)
            buffering_size             = optional(number)
            retry_duration             = optional(number)
            s3_backup_mode             = optional(string)
            cloudwatch_logging_options = optional(list(object({
                enabled         = optional(bool)
                log_group_name  = optional(string)
                log_stream_name = optional(string)
            })))
            processing_configuration   = optional(list(object({
                enabled    = optional(bool)
                processors = optional(list(object({
                    type       = string
                    parameters = optional(set(object({
                        parameter_name  = string
                        parameter_value = string
                    })))
                })))
            })))
            s3_configuration           = list(object({
                bucket_arn                 = string
                role_arn                   = string
                buffering_interval         = optional(number)
                buffering_size             = optional(number)
                compression_format         = optional(string)
                error_output_prefix        = optional(string)
                kms_key_arn                = optional(string)
                prefix                     = optional(string)
                cloudwatch_logging_options = optional(list(object({
                    enabled         = optional(bool)
                    log_group_name  = optional(string)
                    log_stream_name = optional(string)
                })))
            }))
            vpc_config                 = optional(list(object({
                role_arn           = string
                security_group_ids = set(string)
                subnet_ids         = set(string)
            })))
        })))
    redshift_configuration             = optional(list(object({
            cluster_jdbcurl               = string
            data_table_name               = string
            role_arn                      = string
            copy_options                  = optional(string)
            data_table_columns            = optional(string)
            password                      = optional(string)
            retry_duration                = optional(number)
            s3_backup_mode                = optional(string)
            username                      = optional(string)
            cloudwatch_logging_options    = optional(list(object({
                enabled         = optional(bool)
                log_group_name  = optional(string)
                log_stream_name = optional(string)
            })))
            processing_configuration      = optional(list(object({
                enabled    = optional(bool)
                processors = optional(list(object({
                    type       = string
                    parameters = optional(set(object({
                        parameter_name  = string
                        parameter_value = string
                    })))
                })))
            })))
            s3_backup_configuration       = optional(list(object({
                bucket_arn                 = string
                role_arn                   = string
                buffering_interval         = optional(number)
                buffering_size             = optional(number)
                compression_format         = optional(string)
                error_output_prefix        = optional(string)
                kms_key_arn                = optional(string)
                prefix                     = optional(string)
                cloudwatch_logging_options = optional(list(object({
                    enabled         = optional(bool)
                    log_group_name  = optional(string)
                    log_stream_name = optional(string)
                })))
            })))
            s3_configuration              = list(object({
                bucket_arn                 = string
                role_arn                   = string
                buffering_interval         = optional(number)
                buffering_size             = optional(number)
                compression_format         = optional(string)
                error_output_prefix        = optional(string)
                kms_key_arn                = optional(string)
                prefix                     = optional(string)
                cloudwatch_logging_options = optional(list(object({
                    enabled         = optional(bool)
                    log_group_name  = optional(string)
                    log_stream_name = optional(string)
                })))
            }))
            secrets_manager_configuration = optional(list(object({
                enabled    = optional(bool)
                role_arn   = optional(string)
                secret_arn = optional(string)
            })))
        })))
    server_side_encryption             = optional(list(object({
            enabled  = optional(bool)
            key_arn  = optional(string)
            key_type = optional(string)
        })))
    snowflake_configuration            = optional(list(object({
            account_url                   = string
            database                      = string
            role_arn                      = string
            schema                        = string
            table                         = string
            buffering_interval            = optional(number)
            buffering_size                = optional(number)
            content_column_name           = optional(string)
            data_loading_option           = optional(string)
            key_passphrase                = optional(string)
            metadata_column_name          = optional(string)
            private_key                   = optional(string)
            retry_duration                = optional(number)
            s3_backup_mode                = optional(string)
            user                          = optional(string)
            cloudwatch_logging_options    = optional(list(object({
                enabled         = optional(bool)
                log_group_name  = optional(string)
                log_stream_name = optional(string)
            })))
            processing_configuration      = optional(list(object({
                enabled    = optional(bool)
                processors = optional(list(object({
                    type       = string
                    parameters = optional(set(object({
                        parameter_name  = string
                        parameter_value = string
                    })))
                })))
            })))
            s3_configuration              = list(object({
                bucket_arn                 = string
                role_arn                   = string
                buffering_interval         = optional(number)
                buffering_size             = optional(number)
                compression_format         = optional(string)
                error_output_prefix        = optional(string)
                kms_key_arn                = optional(string)
                prefix                     = optional(string)
                cloudwatch_logging_options = optional(list(object({
                    enabled         = optional(bool)
                    log_group_name  = optional(string)
                    log_stream_name = optional(string)
                })))
            }))
            secrets_manager_configuration = optional(list(object({
                enabled    = optional(bool)
                role_arn   = optional(string)
                secret_arn = optional(string)
            })))
            snowflake_role_configuration  = optional(list(object({
                enabled        = optional(bool)
                snowflake_role = optional(string)
            })))
            snowflake_vpc_configuration   = optional(list(object({
                private_link_vpce_id = string
            })))
        })))
    splunk_configuration               = optional(list(object({
            hec_endpoint                  = string
            buffering_interval            = optional(number)
            buffering_size                = optional(number)
            hec_acknowledgment_timeout    = optional(number)
            hec_endpoint_type             = optional(string)
            hec_token                     = optional(string)
            retry_duration                = optional(number)
            s3_backup_mode                = optional(string)
            cloudwatch_logging_options    = optional(list(object({
                enabled         = optional(bool)
                log_group_name  = optional(string)
                log_stream_name = optional(string)
            })))
            processing_configuration      = optional(list(object({
                enabled    = optional(bool)
                processors = optional(list(object({
                    type       = string
                    parameters = optional(set(object({
                        parameter_name  = string
                        parameter_value = string
                    })))
                })))
            })))
            s3_configuration              = list(object({
                bucket_arn                 = string
                role_arn                   = string
                buffering_interval         = optional(number)
                buffering_size             = optional(number)
                compression_format         = optional(string)
                error_output_prefix        = optional(string)
                kms_key_arn                = optional(string)
                prefix                     = optional(string)
                cloudwatch_logging_options = optional(list(object({
                    enabled         = optional(bool)
                    log_group_name  = optional(string)
                    log_stream_name = optional(string)
                })))
            }))
            secrets_manager_configuration = optional(list(object({
                enabled    = optional(bool)
                role_arn   = optional(string)
                secret_arn = optional(string)
            })))
        })))
  }))
}
