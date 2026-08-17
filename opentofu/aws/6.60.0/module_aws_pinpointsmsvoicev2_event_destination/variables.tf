variable "pinpointsmsvoicev2_event_destinations" {
  description = <<EOT
Map of pinpointsmsvoicev2_event_destinations, attributes below
Required:
    - configuration_set_name
    - event_destination_name
    - matching_event_types
Optional:
    - enabled
    - region
    - cloudwatch_logs_destination
    - kinesis_firehose_destination
    - sns_destination
EOT

  type = map(object({
    configuration_set_name       = string
    event_destination_name       = string
    matching_event_types         = set(string)
    enabled                      = optional(bool)
    region                       = optional(string)
    cloudwatch_logs_destination  = optional(list(object({
            iam_role_arn  = string
            log_group_arn = string
        })))
    kinesis_firehose_destination = optional(list(object({
            delivery_stream_arn = string
            iam_role_arn        = string
        })))
    sns_destination              = optional(list(object({
            topic_arn = string
        })))
  }))
}
