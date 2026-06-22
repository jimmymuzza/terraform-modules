variable "ec2_transit_gateway_peering_attachment_accepters" {
  description = <<EOT
Map of ec2_transit_gateway_peering_attachment_accepters, attributes below
Required:
    - transit_gateway_attachment_id
Optional:
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    transit_gateway_attachment_id = string
    region                        = optional(string)
    tags                          = optional(map(string))
    tags_all                      = optional(map(string))
  }))
}
