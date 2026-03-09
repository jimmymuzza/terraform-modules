variable "networkmanager_transit_gateway_peerings" {
  description = <<EOT
Map of networkmanager_transit_gateway_peerings, attributes below
Required:
    - core_network_id
    - transit_gateway_arn
Optional:
    - tags
    - tags_all
EOT

  type = map(object({
    core_network_id     = string
    transit_gateway_arn = string
    tags                = optional(map(string))
    tags_all            = optional(map(string))
  }))
}
