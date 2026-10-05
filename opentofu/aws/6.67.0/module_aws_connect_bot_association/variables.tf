variable "connect_bot_associations" {
  description = <<EOT
Map of connect_bot_associations, attributes below
Required:
    - instance_id
    - lex_bot
Optional:
    - region
EOT

  type = map(object({
    instance_id = string
    region      = optional(string)
    lex_bot     = list(object({
            name       = string
            lex_region = optional(string)
        }))
  }))
}
