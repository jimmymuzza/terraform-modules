variable "waf_regex_pattern_sets" {
  description = <<EOT
Map of waf_regex_pattern_sets, attributes below
Required:
    - name
Optional:
    - regex_pattern_strings
EOT

  type = map(object({
    name                  = string
    regex_pattern_strings = optional(set(string))
  }))
}
