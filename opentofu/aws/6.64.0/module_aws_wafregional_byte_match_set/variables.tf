variable "wafregional_byte_match_sets" {
  description = <<EOT
Map of wafregional_byte_match_sets, attributes below
Required:
    - name
Optional:
    - region
    - byte_match_tuples
EOT

  type = map(object({
    name              = string
    region            = optional(string)
    byte_match_tuples = optional(set(object({
            positional_constraint = string
            text_transformation   = string
            target_string         = optional(string)
            field_to_match        = list(object({
                type = string
                data = optional(string)
            }))
        })))
  }))
}
