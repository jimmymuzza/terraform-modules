variable "connect_routing_profiles" {
  description = <<EOT
Map of connect_routing_profiles, attributes below
Required:
    - default_outbound_queue_id
    - description
    - instance_id
    - name
    - media_concurrencies
Optional:
    - region
    - tags
    - tags_all
    - queue_configs
EOT

  type = map(object({
    default_outbound_queue_id = string
    description               = string
    instance_id               = string
    name                      = string
    region                    = optional(string)
    tags                      = optional(map(string))
    tags_all                  = optional(map(string))
    media_concurrencies       = set(object({
            channel                = string
            concurrency            = number
            cross_channel_behavior = optional(list(object({
                behavior_type = string
            })))
        }))
    queue_configs             = optional(set(object({
            channel  = string
            delay    = number
            priority = number
            queue_id = string
        })))
  }))
}
