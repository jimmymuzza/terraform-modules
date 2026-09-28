variable "lex_slot_types" {
  description = <<EOT
Map of lex_slot_types, attributes below
Required:
    - name
    - enumeration_value
Optional:
    - create_version
    - description
    - region
    - value_selection_strategy
EOT

  type = map(object({
    name                     = string
    create_version           = optional(bool)
    description              = optional(string)
    region                   = optional(string)
    value_selection_strategy = optional(string)
    enumeration_value        = set(object({
            value    = string
            synonyms = optional(set(string))
        }))
  }))
}
