variable "servicecatalog_portfolio_shares" {
  description = <<EOT
Map of servicecatalog_portfolio_shares, attributes below
Required:
    - portfolio_id
    - principal_id
    - type
Optional:
    - accept_language
    - region
    - share_principals
    - share_tag_options
    - wait_for_acceptance
EOT

  type = map(object({
    portfolio_id        = string
    principal_id        = string
    type                = string
    accept_language     = optional(string)
    region              = optional(string)
    share_principals    = optional(bool)
    share_tag_options   = optional(bool)
    wait_for_acceptance = optional(bool)
  }))
}
