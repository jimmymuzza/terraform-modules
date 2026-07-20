variable "cloudwatch_event_endpoints" {
  description = <<EOT
Map of cloudwatch_event_endpoints, attributes below
Required:
    - name
    - event_bus
    - routing_config
Optional:
    - description
    - region
    - role_arn
    - replication_config
EOT

  type = map(object({
    name               = string
    description        = optional(string)
    region             = optional(string)
    role_arn           = optional(string)
    event_bus          = list(object({
            event_bus_arn = string
        }))
    replication_config = optional(list(object({
            state = optional(string)
        })))
    routing_config     = list(object({
            failover_config = list(object({
                primary   = list(object({
                    health_check = optional(string)
                }))
                secondary = list(object({
                    route = optional(string)
                }))
            }))
        }))
  }))
}
