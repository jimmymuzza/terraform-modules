variable "stream_analytics_output_functions" {
  description = <<EOT
Map of stream_analytics_output_functions, attributes below
Required:
    - api_key
    - function_app
    - function_name
    - name
    - resource_group_name
    - stream_analytics_job_name
Optional:
    - batch_max_count
    - batch_max_in_bytes
EOT

  type = map(object({
    api_key                   = string
    function_app              = string
    function_name             = string
    name                      = string
    resource_group_name       = string
    stream_analytics_job_name = string
    batch_max_count           = optional(number)
    batch_max_in_bytes        = optional(number)
  }))
}
