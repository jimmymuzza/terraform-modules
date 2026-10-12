variable "stream_analytics_output_synapses" {
  description = <<EOT
Map of stream_analytics_output_synapses, attributes below
Required:
    - database
    - name
    - password
    - resource_group_name
    - server
    - stream_analytics_job_name
    - table
    - user
EOT

  type = map(object({
    database                  = string
    name                      = string
    password                  = string
    resource_group_name       = string
    server                    = string
    stream_analytics_job_name = string
    table                     = string
    user                      = string
  }))
}
