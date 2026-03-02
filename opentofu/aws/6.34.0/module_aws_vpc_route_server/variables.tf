variable "vpc_route_servers" {
  description = <<EOT
Map of vpc_route_servers, attributes below
Required:
    - amazon_side_asn
Optional:
    - persist_routes
    - persist_routes_duration
    - region
    - sns_notifications_enabled
    - tags
EOT

  type = map(object({
    amazon_side_asn           = number
    persist_routes            = optional(string)
    persist_routes_duration   = optional(number)
    region                    = optional(string)
    sns_notifications_enabled = optional(bool)
    tags                      = optional(map(string))
  }))
}
