variable "stream_analytics_function_javascript_udas" {
  description = <<EOT
Map of stream_analytics_function_javascript_udas, attributes below
Required:
    - name
    - script
    - stream_analytics_job_id
    - input
    - output
EOT

  type = map(object({
    name                    = string
    script                  = string
    stream_analytics_job_id = string
    input                   = list(object({
            type                    = string
            configuration_parameter = optional(bool)
        }))
    output                  = list(object({
            type = string
        }))
  }))
}
