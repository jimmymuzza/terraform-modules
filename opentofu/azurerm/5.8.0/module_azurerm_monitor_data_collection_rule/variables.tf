variable "monitor_data_collection_rules" {
  description = <<EOT
Map of monitor_data_collection_rules, attributes below
Required:
    - location
    - name
    - resource_group_name
    - data_flow
    - destinations
Optional:
    - data_collection_endpoint_id
    - description
    - kind
    - tags
    - data_sources
    - identity
    - stream_declaration
EOT

  type = map(object({
    location                    = string
    name                        = string
    resource_group_name         = string
    data_collection_endpoint_id = optional(string)
    description                 = optional(string)
    kind                        = optional(string)
    tags                        = optional(map(string))
    data_flow                   = list(object({
            destinations       = list(string)
            streams            = list(string)
            built_in_transform = optional(string)
            output_stream      = optional(string)
            transform_kql      = optional(string)
        }))
    data_sources                = optional(list(object({
            data_import          = optional(list(object({
                event_hub_data_source = list(object({
                    name           = string
                    stream         = string
                    consumer_group = optional(string)
                }))
            })))
            extension            = optional(list(object({
                extension_name     = string
                name               = string
                streams            = list(string)
                extension_json     = optional(string)
                input_data_sources = optional(list(string))
            })))
            iis_log              = optional(list(object({
                name            = string
                streams         = list(string)
                log_directories = optional(list(string))
            })))
            log_file             = optional(list(object({
                file_patterns = list(string)
                format        = string
                name          = string
                streams       = list(string)
                settings      = optional(list(object({
                    text = list(object({
                        record_start_timestamp_format = string
                    }))
                })))
            })))
            performance_counter  = optional(list(object({
                counter_specifiers            = list(string)
                name                          = string
                sampling_frequency_in_seconds = number
                streams                       = list(string)
            })))
            platform_telemetry   = optional(list(object({
                name    = string
                streams = list(string)
            })))
            prometheus_forwarder = optional(list(object({
                name                 = string
                streams              = list(string)
                label_include_filter = optional(set(object({
                    label = string
                    value = string
                })))
            })))
            syslog               = optional(list(object({
                facility_names = list(string)
                log_levels     = list(string)
                name           = string
                streams        = list(string)
            })))
            windows_event_log    = optional(list(object({
                name           = string
                streams        = list(string)
                x_path_queries = list(string)
            })))
            windows_firewall_log = optional(list(object({
                name    = string
                streams = list(string)
            })))
        })))
    destinations                = list(object({
            azure_monitor_metrics = optional(list(object({
                name = string
            })))
            event_hub             = optional(list(object({
                event_hub_id = string
                name         = string
            })))
            event_hub_direct      = optional(list(object({
                event_hub_id = string
                name         = string
            })))
            log_analytics         = optional(list(object({
                name                  = string
                workspace_resource_id = string
            })))
            monitor_account       = optional(list(object({
                monitor_account_id = string
                name               = string
            })))
            storage_blob          = optional(list(object({
                container_name     = string
                name               = string
                storage_account_id = string
            })))
            storage_blob_direct   = optional(list(object({
                container_name     = string
                name               = string
                storage_account_id = string
            })))
            storage_table_direct  = optional(list(object({
                name               = string
                storage_account_id = string
                table_name         = string
            })))
        }))
    identity                    = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
    stream_declaration          = optional(set(object({
            stream_name = string
            column      = list(object({
                name = string
                type = string
            }))
        })))
  }))
}
