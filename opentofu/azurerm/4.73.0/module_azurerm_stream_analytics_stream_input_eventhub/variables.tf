variable "stream_analytics_stream_input_eventhubs" {
  description = <<EOT
Map of stream_analytics_stream_input_eventhubs, attributes below
Required:
    - eventhub_name
    - name
    - resource_group_name
    - servicebus_namespace
    - stream_analytics_job_name
    - serialization
Optional:
    - authentication_mode
    - eventhub_consumer_group_name
    - partition_key
    - shared_access_policy_key
    - shared_access_policy_name
EOT

  type = map(object({
    eventhub_name                = string
    name                         = string
    resource_group_name          = string
    servicebus_namespace         = string
    stream_analytics_job_name    = string
    authentication_mode          = optional(string)
    eventhub_consumer_group_name = optional(string)
    partition_key                = optional(string)
    shared_access_policy_key     = optional(string)
    shared_access_policy_name    = optional(string)
    serialization                = list(object({
            type            = string
            encoding        = optional(string)
            field_delimiter = optional(string)
        }))
  }))
}
