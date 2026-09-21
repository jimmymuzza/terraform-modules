variable "stream_analytics_reference_input_mssqls" {
  description = <<EOT
Map of stream_analytics_reference_input_mssqls, attributes below
Required:
    - database
    - full_snapshot_query
    - name
    - password
    - refresh_type
    - resource_group_name
    - server
    - stream_analytics_job_name
    - username
Optional:
    - delta_snapshot_query
    - refresh_interval_duration
    - table
EOT

  type = map(object({
    database                  = string
    full_snapshot_query       = string
    name                      = string
    password                  = string
    refresh_type              = string
    resource_group_name       = string
    server                    = string
    stream_analytics_job_name = string
    username                  = string
    delta_snapshot_query      = optional(string)
    refresh_interval_duration = optional(string)
    table                     = optional(string)
  }))
}
