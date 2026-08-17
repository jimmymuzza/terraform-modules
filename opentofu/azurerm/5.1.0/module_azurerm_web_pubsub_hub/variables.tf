variable "web_pubsub_hubs" {
  description = <<EOT
Map of web_pubsub_hubs, attributes below
Required:
    - name
    - web_pubsub_id
Optional:
    - anonymous_connections_enabled
    - event_handler
    - event_listener
EOT

  type = map(object({
    name                          = string
    web_pubsub_id                 = string
    anonymous_connections_enabled = optional(bool)
    event_handler                 = optional(list(object({
            url_template       = string
            system_events      = optional(set(string))
            user_event_pattern = optional(string)
            auth               = optional(list(object({
                managed_identity_id = string
            })))
        })))
    event_listener                = optional(list(object({
            eventhub_name            = string
            eventhub_namespace_name  = string
            system_event_name_filter = optional(list(string))
            user_event_name_filter   = optional(list(string))
        })))
  }))
}
