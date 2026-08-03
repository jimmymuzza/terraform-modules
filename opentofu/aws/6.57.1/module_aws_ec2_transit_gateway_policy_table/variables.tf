variable "ec2_transit_gateway_policy_tables" {
  description = <<EOT
Map of ec2_transit_gateway_policy_tables, attributes below
Required:
    - transit_gateway_id
Optional:
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    transit_gateway_id = string
    region             = optional(string)
    tags               = optional(map(string))
    tags_all           = optional(map(string))
  }))
}
