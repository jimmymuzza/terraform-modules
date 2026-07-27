variable "sesv2_configuration_set_event_destinations" {
  description = <<EOT
Map of sesv2_configuration_set_event_destinations, attributes below
Required:
    - configuration_set_name
    - event_destination_name
    - event_destination
Optional:
    - region
EOT

  type = map(object({
    configuration_set_name = string
    event_destination_name = string
    region                 = optional(string)
    event_destination      = list(object({
            matching_event_types         = set(string)
            enabled                      = optional(bool)
            cloud_watch_destination      = optional(list(object({
                dimension_configuration = list(object({
                    default_dimension_value = string
                    dimension_name          = string
                    dimension_value_source  = string
                }))
            })))
            event_bridge_destination     = optional(list(object({
                event_bus_arn = string
            })))
            kinesis_firehose_destination = optional(list(object({
                delivery_stream_arn = string
                iam_role_arn        = string
            })))
            pinpoint_destination         = optional(list(object({
                application_arn = string
            })))
            sns_destination              = optional(list(object({
                topic_arn = string
            })))
        }))
  }))
}
