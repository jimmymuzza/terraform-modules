variable "appintegrations_event_integrations" {
  description = <<EOT
Map of appintegrations_event_integrations, attributes below
Required:
    - eventbridge_bus
    - name
    - event_filter
Optional:
    - description
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    eventbridge_bus = string
    name            = string
    description     = optional(string)
    region          = optional(string)
    tags            = optional(map(string))
    tags_all        = optional(map(string))
    event_filter    = list(object({
            source = string
        }))
  }))
}
