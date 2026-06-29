variable "cleanrooms_configured_tables" {
  description = <<EOT
Map of cleanrooms_configured_tables, attributes below
Required:
    - allowed_columns
    - analysis_method
    - name
    - table_reference
Optional:
    - description
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    allowed_columns = set(string)
    analysis_method = string
    name            = string
    description     = optional(string)
    region          = optional(string)
    tags            = optional(map(string))
    tags_all        = optional(map(string))
    table_reference = list(object({
            database_name = string
            table_name    = string
        }))
  }))
}
