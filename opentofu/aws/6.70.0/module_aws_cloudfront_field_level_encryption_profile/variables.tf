variable "cloudfront_field_level_encryption_profiles" {
  description = <<EOT
Map of cloudfront_field_level_encryption_profiles, attributes below
Required:
    - name
    - encryption_entities
Optional:
    - comment
EOT

  type = map(object({
    name                = string
    comment             = optional(string)
    encryption_entities = list(object({
            items = optional(set(object({
                provider_id    = string
                public_key_id  = string
                field_patterns = list(object({
                    items = optional(set(string))
                }))
            })))
        }))
  }))
}
