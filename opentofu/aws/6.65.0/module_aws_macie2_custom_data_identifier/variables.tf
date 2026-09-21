variable "macie2_custom_data_identifiers" {
  description = <<EOT
Map of macie2_custom_data_identifiers, attributes below
Optional:
    - description
    - ignore_words
    - keywords
    - maximum_match_distance
    - name
    - name_prefix
    - regex
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    description            = optional(string)
    ignore_words           = optional(set(string))
    keywords               = optional(set(string))
    maximum_match_distance = optional(number)
    name                   = optional(string)
    name_prefix            = optional(string)
    regex                  = optional(string)
    region                 = optional(string)
    tags                   = optional(map(string))
    tags_all               = optional(map(string))
  }))
}
