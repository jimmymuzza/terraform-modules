variable "servicecatalog_constraints" {
  description = <<EOT
Map of servicecatalog_constraints, attributes below
Required:
    - parameters
    - portfolio_id
    - product_id
    - type
Optional:
    - accept_language
    - description
    - region
EOT

  type = map(object({
    parameters      = string
    portfolio_id    = string
    product_id      = string
    type            = string
    accept_language = optional(string)
    description     = optional(string)
    region          = optional(string)
  }))
}
