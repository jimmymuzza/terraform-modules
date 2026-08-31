variable "vpn_gateway_attachments" {
  description = <<EOT
Map of vpn_gateway_attachments, attributes below
Required:
    - vpc_id
    - vpn_gateway_id
Optional:
    - region
EOT

  type = map(object({
    vpc_id         = string
    vpn_gateway_id = string
    region         = optional(string)
  }))
}
