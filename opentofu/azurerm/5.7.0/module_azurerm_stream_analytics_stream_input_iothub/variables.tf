variable "stream_analytics_stream_input_iothubs" {
  description = <<EOT
Map of stream_analytics_stream_input_iothubs, attributes below
Required:
    - endpoint
    - eventhub_consumer_group_name
    - iothub_namespace
    - name
    - resource_group_name
    - shared_access_policy_key
    - shared_access_policy_name
    - stream_analytics_job_name
    - serialization
EOT

  type = map(object({
    endpoint                     = string
    eventhub_consumer_group_name = string
    iothub_namespace             = string
    name                         = string
    resource_group_name          = string
    shared_access_policy_key     = string
    shared_access_policy_name    = string
    stream_analytics_job_name    = string
    serialization                = list(object({
            type            = string
            encoding        = optional(string)
            field_delimiter = optional(string)
        }))
  }))
}
