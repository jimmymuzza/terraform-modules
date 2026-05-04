variable "data_factory_trigger_custom_events" {
  description = <<EOT
Map of data_factory_trigger_custom_events, attributes below
Required:
    - data_factory_id
    - eventgrid_topic_id
    - events
    - name
    - pipeline
Optional:
    - activated
    - additional_properties
    - annotations
    - description
    - subject_begins_with
    - subject_ends_with
EOT

  type = map(object({
    data_factory_id       = string
    eventgrid_topic_id    = string
    events                = set(string)
    name                  = string
    activated             = optional(bool)
    additional_properties = optional(map(string))
    annotations           = optional(list(string))
    description           = optional(string)
    subject_begins_with   = optional(string)
    subject_ends_with     = optional(string)
    pipeline              = set(object({
            name       = string
            parameters = optional(map(string))
        }))
  }))
}
