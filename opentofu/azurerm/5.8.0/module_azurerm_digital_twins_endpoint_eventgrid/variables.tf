variable "digital_twins_endpoint_eventgrids" {
  description = <<EOT
Map of digital_twins_endpoint_eventgrids, attributes below
Required:
    - digital_twins_id
    - eventgrid_topic_endpoint
    - eventgrid_topic_primary_access_key
    - eventgrid_topic_secondary_access_key
    - name
Optional:
    - dead_letter_storage_secret
EOT

  type = map(object({
    digital_twins_id                     = string
    eventgrid_topic_endpoint             = string
    eventgrid_topic_primary_access_key   = string
    eventgrid_topic_secondary_access_key = string
    name                                 = string
    dead_letter_storage_secret           = optional(string)
  }))
}
