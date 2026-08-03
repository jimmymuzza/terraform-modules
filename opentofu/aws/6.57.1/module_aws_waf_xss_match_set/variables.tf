variable "waf_xss_match_sets" {
  description = <<EOT
Map of waf_xss_match_sets, attributes below
Required:
    - name
Optional:
    - xss_match_tuples
EOT

  type = map(object({
    name             = string
    xss_match_tuples = optional(set(object({
            text_transformation = string
            field_to_match      = list(object({
                type = string
                data = optional(string)
            }))
        })))
  }))
}
