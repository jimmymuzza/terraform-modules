variable "chimesdkvoice_voice_profile_domains" {
  description = <<EOT
Map of chimesdkvoice_voice_profile_domains, attributes below
Required:
    - name
    - server_side_encryption_configuration
Optional:
    - description
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    name                                 = string
    description                          = optional(string)
    region                               = optional(string)
    tags                                 = optional(map(string))
    tags_all                             = optional(map(string))
    server_side_encryption_configuration = list(object({
            kms_key_arn = string
        }))
  }))
}
