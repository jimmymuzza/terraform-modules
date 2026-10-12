variable "eventgrid_system_topic_event_subscriptions" {
  description = <<EOT
Map of eventgrid_system_topic_event_subscriptions, attributes below
Required:
    - name
    - resource_group_name
    - system_topic
Optional:
    - advanced_filtering_on_arrays_enabled
    - event_delivery_schema
    - eventhub_id
    - expiration_time_utc
    - hybrid_connection_id
    - included_event_types
    - labels
    - service_bus_queue_id
    - service_bus_topic_id
    - advanced_filter
    - azure_function_endpoint
    - dead_letter_identity
    - delivery_identity
    - delivery_property
    - retry_policy
    - storage_blob_dead_letter_destination
    - storage_queue_endpoint
    - subject_filter
    - webhook_endpoint
EOT

  type = map(object({
    name                                 = string
    resource_group_name                  = string
    system_topic                         = string
    advanced_filtering_on_arrays_enabled = optional(bool)
    event_delivery_schema                = optional(string)
    eventhub_id                          = optional(string)
    expiration_time_utc                  = optional(string)
    hybrid_connection_id                 = optional(string)
    included_event_types                 = optional(list(string))
    labels                               = optional(list(string))
    service_bus_queue_id                 = optional(string)
    service_bus_topic_id                 = optional(string)
    advanced_filter                      = optional(list(object({
            bool_equals                   = optional(list(object({
                key   = string
                value = bool
            })))
            is_not_null                   = optional(list(object({
                key = string
            })))
            is_null_or_undefined          = optional(list(object({
                key = string
            })))
            number_greater_than           = optional(list(object({
                key   = string
                value = number
            })))
            number_greater_than_or_equals = optional(list(object({
                key   = string
                value = number
            })))
            number_in                     = optional(list(object({
                key    = string
                values = list(number)
            })))
            number_in_range               = optional(list(object({
                key    = string
                values = list(list(number))
            })))
            number_less_than              = optional(list(object({
                key   = string
                value = number
            })))
            number_less_than_or_equals    = optional(list(object({
                key   = string
                value = number
            })))
            number_not_in                 = optional(list(object({
                key    = string
                values = list(number)
            })))
            number_not_in_range           = optional(list(object({
                key    = string
                values = list(list(number))
            })))
            string_begins_with            = optional(list(object({
                key    = string
                values = list(string)
            })))
            string_contains               = optional(list(object({
                key    = string
                values = list(string)
            })))
            string_ends_with              = optional(list(object({
                key    = string
                values = list(string)
            })))
            string_in                     = optional(list(object({
                key    = string
                values = list(string)
            })))
            string_not_begins_with        = optional(list(object({
                key    = string
                values = list(string)
            })))
            string_not_contains           = optional(list(object({
                key    = string
                values = list(string)
            })))
            string_not_ends_with          = optional(list(object({
                key    = string
                values = list(string)
            })))
            string_not_in                 = optional(list(object({
                key    = string
                values = list(string)
            })))
        })))
    azure_function_endpoint              = optional(list(object({
            function_id                       = string
            max_events_per_batch              = optional(number)
            preferred_batch_size_in_kilobytes = optional(number)
        })))
    dead_letter_identity                 = optional(list(object({
            type                   = string
            user_assigned_identity = optional(string)
        })))
    delivery_identity                    = optional(list(object({
            type                   = string
            user_assigned_identity = optional(string)
        })))
    delivery_property                    = optional(list(object({
            header_name  = string
            type         = string
            secret       = optional(bool)
            source_field = optional(string)
            value        = optional(string)
        })))
    retry_policy                         = optional(list(object({
            event_time_to_live    = number
            max_delivery_attempts = number
        })))
    storage_blob_dead_letter_destination = optional(list(object({
            storage_account_id          = string
            storage_blob_container_name = string
        })))
    storage_queue_endpoint               = optional(list(object({
            queue_name                            = string
            storage_account_id                    = string
            queue_message_time_to_live_in_seconds = optional(number)
        })))
    subject_filter                       = optional(list(object({
            case_sensitive      = optional(bool)
            subject_begins_with = optional(string)
            subject_ends_with   = optional(string)
        })))
    webhook_endpoint                     = optional(list(object({
            url                               = string
            active_directory_app_id_or_uri    = optional(string)
            active_directory_tenant_id        = optional(string)
            max_events_per_batch              = optional(number)
            preferred_batch_size_in_kilobytes = optional(number)
        })))
  }))
}
