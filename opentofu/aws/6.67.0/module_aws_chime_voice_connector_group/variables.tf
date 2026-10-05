variable "chime_voice_connector_groups" {
  description = <<EOT
Map of chime_voice_connector_groups, attributes below
Required:
    - name
Optional:
    - region
    - connector
EOT

  type = map(object({
    name      = string
    region    = optional(string)
    connector = optional(set(object({
            priority           = number
            voice_connector_id = string
        })))
  }))
}
