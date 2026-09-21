variable "application_from_templates" {
  description = <<EOT
Map of application_from_templates, attributes below
Required:
    - display_name
    - template_id
EOT

  type = map(object({
    display_name = string
    template_id  = string
  }))
}
