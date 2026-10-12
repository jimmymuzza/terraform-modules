variable "route53_records_exclusives" {
  description = <<EOT
Map of route53_records_exclusives, attributes below
Required:
    - zone_id
Optional:
    - resource_record_set
EOT

  type = map(object({
    zone_id             = string
    resource_record_set = optional(set(object({
            name                       = string
            failover                   = optional(string)
            health_check_id            = optional(string)
            multi_value_answer         = optional(bool)
            region                     = optional(string)
            set_identifier             = optional(string)
            traffic_policy_instance_id = optional(string)
            ttl                        = optional(number)
            type                       = optional(string)
            weight                     = optional(number)
            alias_target               = optional(list(object({
                dns_name               = string
                evaluate_target_health = bool
                hosted_zone_id         = string
            })))
            cidr_routing_config        = optional(list(object({
                collection_id = string
                location_name = string
            })))
            geolocation                = optional(list(object({
                continent_code   = optional(string)
                country_code     = optional(string)
                subdivision_code = optional(string)
            })))
            geoproximity_location      = optional(list(object({
                aws_region       = optional(string)
                bias             = optional(number)
                local_zone_group = optional(string)
                coordinates      = optional(list(object({
                    latitude  = string
                    longitude = string
                })))
            })))
            resource_records           = optional(list(object({
                value = string
            })))
        })))
  }))
}
