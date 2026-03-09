variable "appflow_flows" {
  description = <<EOT
Map of appflow_flows, attributes below
Required:
    - name
    - destination_flow_config
    - source_flow_config
    - task
    - trigger_config
Optional:
    - description
    - kms_arn
    - region
    - tags
    - tags_all
    - metadata_catalog_config
EOT

  type = map(object({
    name                    = string
    description             = optional(string)
    kms_arn                 = optional(string)
    region                  = optional(string)
    tags                    = optional(map(string))
    tags_all                = optional(map(string))
    destination_flow_config = list(object({
            connector_type                   = string
            api_version                      = optional(string)
            connector_profile_name           = optional(string)
            destination_connector_properties = list(object({
                custom_connector  = optional(list(object({
                    entity_name           = string
                    custom_properties     = optional(map(string))
                    id_field_names        = optional(list(string))
                    write_operation_type  = optional(string)
                    error_handling_config = optional(list(object({
                        bucket_name                     = optional(string)
                        bucket_prefix                   = optional(string)
                        fail_on_first_destination_error = optional(bool)
                    })))
                })))
                customer_profiles = optional(list(object({
                    domain_name      = string
                    object_type_name = optional(string)
                })))
                event_bridge      = optional(list(object({
                    object                = string
                    error_handling_config = optional(list(object({
                        bucket_name                     = optional(string)
                        bucket_prefix                   = optional(string)
                        fail_on_first_destination_error = optional(bool)
                    })))
                })))
                honeycode         = optional(list(object({
                    object                = string
                    error_handling_config = optional(list(object({
                        bucket_name                     = optional(string)
                        bucket_prefix                   = optional(string)
                        fail_on_first_destination_error = optional(bool)
                    })))
                })))
                lookout_metrics   = optional(list(object({

                })))
                marketo           = optional(list(object({
                    object                = string
                    error_handling_config = optional(list(object({
                        bucket_name                     = optional(string)
                        bucket_prefix                   = optional(string)
                        fail_on_first_destination_error = optional(bool)
                    })))
                })))
                redshift          = optional(list(object({
                    intermediate_bucket_name = string
                    object                   = string
                    bucket_prefix            = optional(string)
                    error_handling_config    = optional(list(object({
                        bucket_name                     = optional(string)
                        bucket_prefix                   = optional(string)
                        fail_on_first_destination_error = optional(bool)
                    })))
                })))
                s3                = optional(list(object({
                    bucket_name             = string
                    bucket_prefix           = optional(string)
                    s3_output_format_config = optional(list(object({
                        file_type                   = optional(string)
                        preserve_source_data_typing = optional(bool)
                        aggregation_config          = optional(list(object({
                            aggregation_type = optional(string)
                            target_file_size = optional(number)
                        })))
                        prefix_config               = optional(list(object({
                            prefix_format    = optional(string)
                            prefix_hierarchy = optional(list(string))
                            prefix_type      = optional(string)
                        })))
                    })))
                })))
                salesforce        = optional(list(object({
                    object                = string
                    data_transfer_api     = optional(string)
                    id_field_names        = optional(list(string))
                    write_operation_type  = optional(string)
                    error_handling_config = optional(list(object({
                        bucket_name                     = optional(string)
                        bucket_prefix                   = optional(string)
                        fail_on_first_destination_error = optional(bool)
                    })))
                })))
                sapo_data         = optional(list(object({
                    object_path                      = string
                    id_field_names                   = optional(list(string))
                    write_operation_type             = optional(string)
                    error_handling_config            = optional(list(object({
                        bucket_name                     = optional(string)
                        bucket_prefix                   = optional(string)
                        fail_on_first_destination_error = optional(bool)
                    })))
                    success_response_handling_config = optional(list(object({
                        bucket_name   = optional(string)
                        bucket_prefix = optional(string)
                    })))
                })))
                snowflake         = optional(list(object({
                    intermediate_bucket_name = string
                    object                   = string
                    bucket_prefix            = optional(string)
                    error_handling_config    = optional(list(object({
                        bucket_name                     = optional(string)
                        bucket_prefix                   = optional(string)
                        fail_on_first_destination_error = optional(bool)
                    })))
                })))
                upsolver          = optional(list(object({
                    bucket_name             = string
                    bucket_prefix           = optional(string)
                    s3_output_format_config = list(object({
                        file_type          = optional(string)
                        aggregation_config = optional(list(object({
                            aggregation_type = optional(string)
                        })))
                        prefix_config      = list(object({
                            prefix_type      = string
                            prefix_format    = optional(string)
                            prefix_hierarchy = optional(list(string))
                        }))
                    }))
                })))
                zendesk           = optional(list(object({
                    object                = string
                    id_field_names        = optional(list(string))
                    write_operation_type  = optional(string)
                    error_handling_config = optional(list(object({
                        bucket_name                     = optional(string)
                        bucket_prefix                   = optional(string)
                        fail_on_first_destination_error = optional(bool)
                    })))
                })))
            }))
        }))
    metadata_catalog_config = optional(list(object({
            glue_data_catalog = optional(list(object({
                database_name = string
                role_arn      = string
                table_prefix  = string
            })))
        })))
    source_flow_config      = list(object({
            connector_type              = string
            api_version                 = optional(string)
            connector_profile_name      = optional(string)
            incremental_pull_config     = optional(list(object({
                datetime_type_field_name = optional(string)
            })))
            source_connector_properties = list(object({
                amplitude        = optional(list(object({
                    object = string
                })))
                custom_connector = optional(list(object({
                    entity_name       = string
                    custom_properties = optional(map(string))
                })))
                datadog          = optional(list(object({
                    object = string
                })))
                dynatrace        = optional(list(object({
                    object = string
                })))
                google_analytics = optional(list(object({
                    object = string
                })))
                infor_nexus      = optional(list(object({
                    object = string
                })))
                marketo          = optional(list(object({
                    object = string
                })))
                s3               = optional(list(object({
                    bucket_name            = string
                    bucket_prefix          = string
                    s3_input_format_config = optional(list(object({
                        s3_input_file_type = optional(string)
                    })))
                })))
                salesforce       = optional(list(object({
                    object                      = string
                    data_transfer_api           = optional(string)
                    enable_dynamic_field_update = optional(bool)
                    include_deleted_records     = optional(bool)
                })))
                sapo_data        = optional(list(object({
                    object_path        = string
                    pagination_config  = optional(list(object({
                        max_page_size = number
                    })))
                    parallelism_config = optional(list(object({
                        max_page_size = number
                    })))
                })))
                service_now      = optional(list(object({
                    object = string
                })))
                singular         = optional(list(object({
                    object = string
                })))
                slack            = optional(list(object({
                    object = string
                })))
                trendmicro       = optional(list(object({
                    object = string
                })))
                veeva            = optional(list(object({
                    object               = string
                    document_type        = optional(string)
                    include_all_versions = optional(bool)
                    include_renditions   = optional(bool)
                    include_source_files = optional(bool)
                })))
                zendesk          = optional(list(object({
                    object = string
                })))
            }))
        }))
    task                    = set(object({
            task_type          = string
            destination_field  = optional(string)
            source_fields      = optional(list(string))
            task_properties    = optional(map(string))
            connector_operator = optional(list(object({
                amplitude        = optional(string)
                custom_connector = optional(string)
                datadog          = optional(string)
                dynatrace        = optional(string)
                google_analytics = optional(string)
                infor_nexus      = optional(string)
                marketo          = optional(string)
                s3               = optional(string)
                salesforce       = optional(string)
                sapo_data        = optional(string)
                service_now      = optional(string)
                singular         = optional(string)
                slack            = optional(string)
                trendmicro       = optional(string)
                veeva            = optional(string)
                zendesk          = optional(string)
            })))
        }))
    trigger_config          = list(object({
            trigger_type       = string
            trigger_properties = optional(list(object({
                scheduled = optional(list(object({
                    schedule_expression  = string
                    data_pull_mode       = optional(string)
                    first_execution_from = optional(string)
                    schedule_end_time    = optional(string)
                    schedule_offset      = optional(number)
                    schedule_start_time  = optional(string)
                    timezone             = optional(string)
                })))
            })))
        }))
  }))
}
