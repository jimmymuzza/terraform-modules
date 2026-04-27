variable "billing_views" {
  description = <<EOT
Map of billing_views, attributes below
Required:
    - name
Optional:
    - description
    - source_views
    - tags
    - data_filter_expression
EOT

  type = map(object({
    name                   = string
    description            = optional(string)
    source_views           = optional(list(string))
    tags                   = optional(map(string))
    data_filter_expression = optional(list(object({
            dimensions = optional(list(object({
                key    = string
                values = set(string)
            })))
            tags       = optional(list(object({
                key    = string
                values = list(string)
            })))
            time_range = optional(list(object({
                begin_date_inclusive = string
                end_date_inclusive   = string
            })))
        })))
  }))
}
