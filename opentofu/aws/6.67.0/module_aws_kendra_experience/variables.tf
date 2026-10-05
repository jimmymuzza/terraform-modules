variable "kendra_experiences" {
  description = <<EOT
Map of kendra_experiences, attributes below
Required:
    - index_id
    - name
    - role_arn
Optional:
    - description
    - region
    - configuration
EOT

  type = map(object({
    index_id      = string
    name          = string
    role_arn      = string
    description   = optional(string)
    region        = optional(string)
    configuration = optional(list(object({
            content_source_configuration = optional(list(object({
                data_source_ids    = optional(set(string))
                direct_put_content = optional(bool)
                faq_ids            = optional(set(string))
            })))
            user_identity_configuration  = optional(list(object({
                identity_attribute_name = string
            })))
        })))
  }))
}
