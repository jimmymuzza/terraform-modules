variable "chimesdkvoice_global_settings" {
  description = <<EOT
Map of chimesdkvoice_global_settings, attributes below
Required:
    - voice_connector
EOT

  type = map(object({
    voice_connector = list(object({
            cdr_bucket = optional(string)
        }))
  }))
}
