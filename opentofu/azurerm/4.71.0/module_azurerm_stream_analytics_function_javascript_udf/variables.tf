variable "stream_analytics_function_javascript_udfs" {
  description = <<EOT
Map of stream_analytics_function_javascript_udfs, attributes below
Required:
    - name
    - resource_group_name
    - script
    - stream_analytics_job_name
    - input
    - output
EOT

  type = map(object({
    name                      = string
    resource_group_name       = string
    script                    = string
    stream_analytics_job_name = string
    input                     = list(object({
            type                    = string
            configuration_parameter = optional(bool)
        }))
    output                    = list(object({
            type = string
        }))
  }))
}
