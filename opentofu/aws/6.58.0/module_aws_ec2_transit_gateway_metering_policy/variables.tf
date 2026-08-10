variable "ec2_transit_gateway_metering_policies" {
  description = <<EOT
Map of ec2_transit_gateway_metering_policies, attributes below
Required:
    - transit_gateway_id
Optional:
    - middlebox_attachment_ids
    - region
    - tags
EOT

  type = map(object({
    transit_gateway_id       = string
    middlebox_attachment_ids = optional(set(string))
    region                   = optional(string)
    tags                     = optional(map(string))
  }))
}
