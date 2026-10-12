variable "stream_analytics_output_servicebus_queues" {
  description = <<EOT
Map of stream_analytics_output_servicebus_queues, attributes below
Required:
    - name
    - queue_name
    - resource_group_name
    - servicebus_namespace
    - stream_analytics_job_name
    - serialization
Optional:
    - authentication_mode
    - property_columns
    - shared_access_policy_key
    - shared_access_policy_name
    - system_property_columns
EOT

  type = map(object({
    name                      = string
    queue_name                = string
    resource_group_name       = string
    servicebus_namespace      = string
    stream_analytics_job_name = string
    authentication_mode       = optional(string)
    property_columns          = optional(list(string))
    shared_access_policy_key  = optional(string)
    shared_access_policy_name = optional(string)
    system_property_columns   = optional(map(string))
    serialization             = list(object({
            type            = string
            encoding        = optional(string)
            field_delimiter = optional(string)
            format          = optional(string)
        }))
  }))
}
