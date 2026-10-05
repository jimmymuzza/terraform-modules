variable "api_management_email_templates" {
  description = <<EOT
Map of api_management_email_templates, attributes below
Required:
    - api_management_name
    - body
    - resource_group_name
    - subject
    - template_name
EOT

  type = map(object({
    api_management_name = string
    body                = string
    resource_group_name = string
    subject             = string
    template_name       = string
  }))
}
