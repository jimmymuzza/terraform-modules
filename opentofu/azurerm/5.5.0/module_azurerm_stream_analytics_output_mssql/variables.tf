variable "stream_analytics_output_mssqls" {
  description = <<EOT
Map of stream_analytics_output_mssqls, attributes below
Required:
    - database
    - name
    - resource_group_name
    - server
    - stream_analytics_job_name
    - table
Optional:
    - authentication_mode
    - max_batch_count
    - max_writer_count
    - password
    - user
EOT

  type = map(object({
    database                  = string
    name                      = string
    resource_group_name       = string
    server                    = string
    stream_analytics_job_name = string
    table                     = string
    authentication_mode       = optional(string)
    max_batch_count           = optional(number)
    max_writer_count          = optional(number)
    password                  = optional(string)
    user                      = optional(string)
  }))
}
