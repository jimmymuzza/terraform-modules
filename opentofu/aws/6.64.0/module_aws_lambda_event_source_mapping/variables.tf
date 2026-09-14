variable "lambda_event_source_mappings" {
  description = <<EOT
Map of lambda_event_source_mappings, attributes below
Required:
    - function_name
Optional:
    - batch_size
    - bisect_batch_on_function_error
    - enabled
    - event_source_arn
    - function_response_types
    - kms_key_arn
    - maximum_batching_window_in_seconds
    - maximum_record_age_in_seconds
    - maximum_retry_attempts
    - parallelization_factor
    - queues
    - region
    - starting_position
    - starting_position_timestamp
    - tags
    - tags_all
    - topics
    - tumbling_window_in_seconds
    - use_resource_timeout_for_propagation
    - amazon_managed_kafka_event_source_config
    - destination_config
    - document_db_event_source_config
    - filter_criteria
    - metrics_config
    - provisioned_poller_config
    - scaling_config
    - self_managed_event_source
    - self_managed_kafka_event_source_config
    - source_access_configuration
EOT

  type = map(object({
    function_name                            = string
    batch_size                               = optional(number)
    bisect_batch_on_function_error           = optional(bool)
    enabled                                  = optional(bool)
    event_source_arn                         = optional(string)
    function_response_types                  = optional(set(string))
    kms_key_arn                              = optional(string)
    maximum_batching_window_in_seconds       = optional(number)
    maximum_record_age_in_seconds            = optional(number)
    maximum_retry_attempts                   = optional(number)
    parallelization_factor                   = optional(number)
    queues                                   = optional(list(string))
    region                                   = optional(string)
    starting_position                        = optional(string)
    starting_position_timestamp              = optional(string)
    tags                                     = optional(map(string))
    tags_all                                 = optional(map(string))
    topics                                   = optional(set(string))
    tumbling_window_in_seconds               = optional(number)
    use_resource_timeout_for_propagation     = optional(bool)
    amazon_managed_kafka_event_source_config = optional(list(object({
            consumer_group_id      = optional(string)
            schema_registry_config = optional(list(object({
                event_record_format      = optional(string)
                schema_registry_uri      = optional(string)
                access_config            = optional(set(object({
                    type = optional(string)
                    uri  = optional(string)
                })))
                schema_validation_config = optional(set(object({
                    attribute = optional(string)
                })))
            })))
        })))
    destination_config                       = optional(list(object({
            on_failure = optional(list(object({
                destination_arn = string
            })))
        })))
    document_db_event_source_config          = optional(list(object({
            database_name   = string
            collection_name = optional(string)
            full_document   = optional(string)
        })))
    filter_criteria                          = optional(list(object({
            filter = optional(set(object({
                pattern = optional(string)
            })))
        })))
    metrics_config                           = optional(list(object({
            metrics = set(string)
        })))
    provisioned_poller_config                = optional(list(object({
            maximum_pollers   = optional(number)
            minimum_pollers   = optional(number)
            poller_group_name = optional(string)
        })))
    scaling_config                           = optional(list(object({
            maximum_concurrency = optional(number)
        })))
    self_managed_event_source                = optional(list(object({
            endpoints = map(string)
        })))
    self_managed_kafka_event_source_config   = optional(list(object({
            consumer_group_id      = optional(string)
            schema_registry_config = optional(list(object({
                event_record_format      = optional(string)
                schema_registry_uri      = optional(string)
                access_config            = optional(set(object({
                    type = optional(string)
                    uri  = optional(string)
                })))
                schema_validation_config = optional(set(object({
                    attribute = optional(string)
                })))
            })))
        })))
    source_access_configuration              = optional(set(object({
            type = string
            uri  = string
        })))
  }))
}
