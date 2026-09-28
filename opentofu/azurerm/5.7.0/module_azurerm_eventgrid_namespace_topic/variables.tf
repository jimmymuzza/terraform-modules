variable "eventgrid_namespace_topics" {
  description = <<EOT
Map of eventgrid_namespace_topics, attributes below
Required:
    - eventgrid_namespace_id
    - name
Optional:
    - event_retention_in_days
EOT

  type = map(object({
    eventgrid_namespace_id  = string
    name                    = string
    event_retention_in_days = optional(number)
  }))
}
