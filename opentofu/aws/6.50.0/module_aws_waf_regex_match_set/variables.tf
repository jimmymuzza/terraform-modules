variable "waf_regex_match_sets" {
  description = <<EOT
Map of waf_regex_match_sets, attributes below
Required:
    - name
Optional:
    - regex_match_tuple
EOT

  type = map(object({
    name              = string
    regex_match_tuple = optional(set(object({
            regex_pattern_set_id = string
            text_transformation  = string
            field_to_match       = list(object({
                type = string
                data = optional(string)
            }))
        })))
  }))
}
