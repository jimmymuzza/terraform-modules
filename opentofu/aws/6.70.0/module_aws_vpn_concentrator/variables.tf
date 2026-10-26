variable "vpn_concentrators" {
  description = <<EOT
Map of vpn_concentrators, attributes below
Required:
    - transit_gateway_id
    - type
Optional:
    - region
    - tags
EOT

  type = map(object({
    transit_gateway_id = string
    type               = string
    region             = optional(string)
    tags               = optional(map(string))
  }))
}
