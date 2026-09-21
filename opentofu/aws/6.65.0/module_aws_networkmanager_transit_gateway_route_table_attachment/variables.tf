variable "networkmanager_transit_gateway_route_table_attachments" {
  description = <<EOT
Map of networkmanager_transit_gateway_route_table_attachments, attributes below
Required:
    - peering_id
    - transit_gateway_route_table_arn
Optional:
    - routing_policy_label
    - tags
    - tags_all
EOT

  type = map(object({
    peering_id                      = string
    transit_gateway_route_table_arn = string
    routing_policy_label            = optional(string)
    tags                            = optional(map(string))
    tags_all                        = optional(map(string))
  }))
}
