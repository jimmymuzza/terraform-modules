variable "glue_data_quality_rulesets" {
  description = <<EOT
Map of glue_data_quality_rulesets, attributes below
Required:
    - name
    - ruleset
Optional:
    - description
    - region
    - tags
    - tags_all
    - target_table
EOT

  type = map(object({
    name         = string
    ruleset      = string
    description  = optional(string)
    region       = optional(string)
    tags         = optional(map(string))
    tags_all     = optional(map(string))
    target_table = optional(list(object({
            database_name = string
            table_name    = string
            catalog_id    = optional(string)
        })))
  }))
}
