variable "waf_sql_injection_match_sets" {
  description = <<EOT
Map of waf_sql_injection_match_sets, attributes below
Required:
    - name
Optional:
    - sql_injection_match_tuples
EOT

  type = map(object({
    name                       = string
    sql_injection_match_tuples = optional(set(object({
            text_transformation = string
            field_to_match      = list(object({
                type = string
                data = optional(string)
            }))
        })))
  }))
}
