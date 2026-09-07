variable "ses_event_destinations" {
  description = <<EOT
Map of ses_event_destinations, attributes below
Required:
    - configuration_set_name
    - matching_types
    - name
Optional:
    - enabled
    - region
    - cloudwatch_destination
    - kinesis_destination
    - sns_destination
EOT

  type = map(object({
    configuration_set_name = string
    matching_types         = set(string)
    name                   = string
    enabled                = optional(bool)
    region                 = optional(string)
    cloudwatch_destination = optional(set(object({
            default_value  = string
            dimension_name = string
            value_source   = string
        })))
    kinesis_destination    = optional(list(object({
            role_arn   = string
            stream_arn = string
        })))
    sns_destination        = optional(list(object({
            topic_arn = string
        })))
  }))
}
