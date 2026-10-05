variable "dynamodb_contributor_insights" {
  description = <<EOT
Map of dynamodb_contributor_insights, attributes below
Required:
    - table_name
Optional:
    - index_name
    - mode
    - region
EOT

  type = map(object({
    table_name = string
    index_name = optional(string)
    mode       = optional(string)
    region     = optional(string)
  }))
}
