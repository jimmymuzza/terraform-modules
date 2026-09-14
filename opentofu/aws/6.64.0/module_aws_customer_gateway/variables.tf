variable "customer_gateways" {
  description = <<EOT
Map of customer_gateways, attributes below
Required:
    - type
Optional:
    - bgp_asn
    - bgp_asn_extended
    - certificate_arn
    - device_name
    - ip_address
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    type             = string
    bgp_asn          = optional(string)
    bgp_asn_extended = optional(string)
    certificate_arn  = optional(string)
    device_name      = optional(string)
    ip_address       = optional(string)
    region           = optional(string)
    tags             = optional(map(string))
    tags_all         = optional(map(string))
  }))
}
