variable "wafv2_regex_pattern_sets" {
  description = <<EOT
Map of wafv2_regex_pattern_sets, attributes below
Required:
    - scope
Optional:
    - description
    - name
    - name_prefix
    - region
    - tags
    - tags_all
    - regular_expression
EOT

  type = map(object({
    scope              = string
    description        = optional(string)
    name               = optional(string)
    name_prefix        = optional(string)
    region             = optional(string)
    tags               = optional(map(string))
    tags_all           = optional(map(string))
    regular_expression = optional(set(object({
            regex_string = string
        })))
  }))
}
