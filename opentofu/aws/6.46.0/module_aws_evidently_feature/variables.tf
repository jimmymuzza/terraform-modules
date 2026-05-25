variable "evidently_features" {
  description = <<EOT
Map of evidently_features, attributes below
Required:
    - name
    - project
    - variations
Optional:
    - default_variation
    - description
    - entity_overrides
    - evaluation_strategy
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    name                = string
    project             = string
    default_variation   = optional(string)
    description         = optional(string)
    entity_overrides    = optional(map(string))
    evaluation_strategy = optional(string)
    region              = optional(string)
    tags                = optional(map(string))
    tags_all            = optional(map(string))
    variations          = set(object({
            name  = string
            value = list(object({
                bool_value   = optional(string)
                double_value = optional(string)
                long_value   = optional(string)
                string_value = optional(string)
            }))
        }))
  }))
}
