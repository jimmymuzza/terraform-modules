variable "dx_gateway_association_proposals" {
  description = <<EOT
Map of dx_gateway_association_proposals, attributes below
Required:
    - associated_gateway_id
    - dx_gateway_id
    - dx_gateway_owner_account_id
Optional:
    - allowed_prefixes
    - region
EOT

  type = map(object({
    associated_gateway_id       = string
    dx_gateway_id               = string
    dx_gateway_owner_account_id = string
    allowed_prefixes            = optional(set(string))
    region                      = optional(string)
  }))
}
