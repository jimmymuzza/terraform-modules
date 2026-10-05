variable "dx_gateway_associations" {
  description = <<EOT
Map of dx_gateway_associations, attributes below
Required:
    - dx_gateway_id
Optional:
    - allowed_prefixes
    - associated_gateway_id
    - associated_gateway_owner_account_id
    - proposal_id
    - region
EOT

  type = map(object({
    dx_gateway_id                       = string
    allowed_prefixes                    = optional(set(string))
    associated_gateway_id               = optional(string)
    associated_gateway_owner_account_id = optional(string)
    proposal_id                         = optional(string)
    region                              = optional(string)
  }))
}
