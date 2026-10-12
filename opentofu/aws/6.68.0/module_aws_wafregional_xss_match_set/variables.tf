variable "wafregional_xss_match_sets" {
  description = <<EOT
Map of wafregional_xss_match_sets, attributes below
Required:
    - name
Optional:
    - region
    - xss_match_tuple
EOT

  type = map(object({
    name            = string
    region          = optional(string)
    xss_match_tuple = optional(set(object({
            text_transformation = string
            field_to_match      = list(object({
                type = string
                data = optional(string)
            }))
        })))
  }))
}
