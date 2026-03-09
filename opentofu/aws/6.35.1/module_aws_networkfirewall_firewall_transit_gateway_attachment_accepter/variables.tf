variable "networkfirewall_firewall_transit_gateway_attachment_accepters" {
  description = <<EOT
Map of networkfirewall_firewall_transit_gateway_attachment_accepters, attributes below
Required:
    - transit_gateway_attachment_id
Optional:
    - region
EOT

  type = map(object({
    transit_gateway_attachment_id = string
    region                        = optional(string)
  }))
}
