variable "lexv2models_bot_versions" {
  description = <<EOT
Map of lexv2models_bot_versions, attributes below
Required:
    - bot_id
    - locale_specification
Optional:
    - bot_version
    - description
    - region
EOT

  type = map(object({
    bot_id               = string
    locale_specification = map(object({
            source_bot_version = string
        }))
    bot_version          = optional(string)
    description          = optional(string)
    region               = optional(string)
  }))
}
