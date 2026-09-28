variable "servicecatalog_portfolios" {
  description = <<EOT
Map of servicecatalog_portfolios, attributes below
Required:
    - name
    - provider_name
Optional:
    - description
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    name          = string
    provider_name = string
    description   = optional(string)
    region        = optional(string)
    tags          = optional(map(string))
    tags_all      = optional(map(string))
  }))
}
