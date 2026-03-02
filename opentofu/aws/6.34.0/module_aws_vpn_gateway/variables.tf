variable "vpn_gateways" {
  description = <<EOT
Map of vpn_gateways, attributes below
Optional:
    - amazon_side_asn
    - availability_zone
    - region
    - tags
    - tags_all
    - vpc_id
EOT

  type = map(object({
    amazon_side_asn   = optional(string)
    availability_zone = optional(string)
    region            = optional(string)
    tags              = optional(map(string))
    tags_all          = optional(map(string))
    vpc_id            = optional(string)
  }))
}
