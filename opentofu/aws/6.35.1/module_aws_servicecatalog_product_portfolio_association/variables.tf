variable "servicecatalog_product_portfolio_associations" {
  description = <<EOT
Map of servicecatalog_product_portfolio_associations, attributes below
Required:
    - portfolio_id
    - product_id
Optional:
    - accept_language
    - region
    - source_portfolio_id
EOT

  type = map(object({
    portfolio_id        = string
    product_id          = string
    accept_language     = optional(string)
    region              = optional(string)
    source_portfolio_id = optional(string)
  }))
}
