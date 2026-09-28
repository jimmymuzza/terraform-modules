variable "ec2_transit_gateway_policy_table_associations" {
  description = <<EOT
Map of ec2_transit_gateway_policy_table_associations, attributes below
Required:
    - transit_gateway_attachment_id
    - transit_gateway_policy_table_id
Optional:
    - region
EOT

  type = map(object({
    transit_gateway_attachment_id   = string
    transit_gateway_policy_table_id = string
    region                          = optional(string)
  }))
}
