variable "pinpoint_email_templates" {
  description = <<EOT
Map of pinpoint_email_templates, attributes below
Required:
    - template_name
Optional:
    - region
    - tags
    - email_template
EOT

  type = map(object({
    template_name  = string
    region         = optional(string)
    tags           = optional(map(string))
    email_template = optional(list(object({
            default_substitutions = optional(string)
            description           = optional(string)
            html_part             = optional(string)
            recommender_id        = optional(string)
            subject               = optional(string)
            text_part             = optional(string)
            header                = optional(list(object({
                name  = optional(string)
                value = optional(string)
            })))
        })))
  }))
}
