variable "wafregional_regex_pattern_sets" {
  description = <<EOT
Map of wafregional_regex_pattern_sets, attributes below
Required:
    - name
Optional:
    - regex_pattern_strings
    - region
EOT

  type = map(object({
    name                  = string
    regex_pattern_strings = optional(set(string))
    region                = optional(string)
  }))
}
