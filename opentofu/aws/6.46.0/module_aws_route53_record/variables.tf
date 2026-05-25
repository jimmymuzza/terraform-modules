variable "route53_records" {
  description = <<EOT
Map of route53_records, attributes below
Required:
    - name
    - type
    - zone_id
Optional:
    - allow_overwrite
    - health_check_id
    - multivalue_answer_routing_policy
    - records
    - set_identifier
    - ttl
    - alias
    - cidr_routing_policy
    - failover_routing_policy
    - geolocation_routing_policy
    - geoproximity_routing_policy
    - latency_routing_policy
    - weighted_routing_policy
EOT

  type = map(object({
    name                             = string
    type                             = string
    zone_id                          = string
    allow_overwrite                  = optional(bool)
    health_check_id                  = optional(string)
    multivalue_answer_routing_policy = optional(bool)
    records                          = optional(set(string))
    set_identifier                   = optional(string)
    ttl                              = optional(number)
    alias                            = optional(list(object({
            evaluate_target_health = bool
            name                   = string
            zone_id                = string
        })))
    cidr_routing_policy              = optional(list(object({
            collection_id = string
            location_name = string
        })))
    failover_routing_policy          = optional(list(object({
            type = string
        })))
    geolocation_routing_policy       = optional(list(object({
            continent   = optional(string)
            country     = optional(string)
            subdivision = optional(string)
        })))
    geoproximity_routing_policy      = optional(list(object({
            aws_region       = optional(string)
            bias             = optional(number)
            local_zone_group = optional(string)
            coordinates      = optional(set(object({
                latitude  = string
                longitude = string
            })))
        })))
    latency_routing_policy           = optional(list(object({
            region = string
        })))
    weighted_routing_policy          = optional(list(object({
            weight = number
        })))
  }))
}
