variable "datazone_glossary_terms" {
  description = <<EOT
Map of datazone_glossary_terms, attributes below
Required:
    - glossary_identifier
    - name
Optional:
    - domain_identifier
    - long_description
    - region
    - short_description
    - status
    - term_relations
EOT

  type = map(object({
    glossary_identifier = string
    name                = string
    domain_identifier   = optional(string)
    long_description    = optional(string)
    region              = optional(string)
    short_description   = optional(string)
    status              = optional(string)
    term_relations      = optional(list(object({
            classifies = optional(set(string))
            is_a       = optional(set(string))
        })))
  }))
}
