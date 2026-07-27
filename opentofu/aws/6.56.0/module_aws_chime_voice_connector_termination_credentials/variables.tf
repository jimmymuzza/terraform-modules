variable "chime_voice_connector_termination_credentials" {
  description = <<EOT
Map of chime_voice_connector_termination_credentials, attributes below
Required:
    - voice_connector_id
    - credentials
Optional:
    - region
EOT

  type = map(object({
    voice_connector_id = string
    region             = optional(string)
    credentials        = set(object({
            password = string
            username = string
        }))
  }))
}
