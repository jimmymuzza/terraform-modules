variable "stream_analytics_output_servicebus_topics" {
  description = <<EOT
Map of stream_analytics_output_servicebus_topics, attributes below
Required:
    - name
    - resource_group_name
    - servicebus_namespace
    - stream_analytics_job_name
    - topic_name
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
    resource_group_name       = string
    servicebus_namespace      = string
    stream_analytics_job_name = string
    topic_name                = string
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
