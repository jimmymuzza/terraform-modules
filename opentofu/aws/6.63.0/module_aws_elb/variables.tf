variable "elbs" {
  description = <<EOT
Map of elbs, attributes below
Required:
    - listener
Optional:
    - availability_zones
    - connection_draining
    - connection_draining_timeout
    - cross_zone_load_balancing
    - desync_mitigation_mode
    - idle_timeout
    - instances
    - internal
    - name
    - name_prefix
    - region
    - security_groups
    - source_security_group
    - subnets
    - tags
    - tags_all
    - access_logs
    - health_check
EOT

  type = map(object({
    availability_zones          = optional(set(string))
    connection_draining         = optional(bool)
    connection_draining_timeout = optional(number)
    cross_zone_load_balancing   = optional(bool)
    desync_mitigation_mode      = optional(string)
    idle_timeout                = optional(number)
    instances                   = optional(set(string))
    internal                    = optional(bool)
    name                        = optional(string)
    name_prefix                 = optional(string)
    region                      = optional(string)
    security_groups             = optional(set(string))
    source_security_group       = optional(string)
    subnets                     = optional(set(string))
    tags                        = optional(map(string))
    tags_all                    = optional(map(string))
    access_logs                 = optional(list(object({
            bucket        = string
            bucket_prefix = optional(string)
            enabled       = optional(bool)
            interval      = optional(number)
        })))
    health_check                = optional(list(object({
            healthy_threshold   = number
            interval            = number
            target              = string
            timeout             = number
            unhealthy_threshold = number
        })))
    listener                    = set(object({
            instance_port      = number
            instance_protocol  = string
            lb_port            = number
            lb_protocol        = string
            ssl_certificate_id = optional(string)
        }))
  }))
}
