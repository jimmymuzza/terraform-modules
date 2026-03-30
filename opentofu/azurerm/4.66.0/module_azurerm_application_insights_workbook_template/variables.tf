variable "application_insights_workbook_templates" {
  description = <<EOT
Map of application_insights_workbook_templates, attributes below
Required:
    - location
    - name
    - resource_group_name
    - template_data
    - galleries
Optional:
    - author
    - localized
    - priority
    - tags
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    template_data       = string
    author              = optional(string)
    localized           = optional(string)
    priority            = optional(number)
    tags                = optional(map(string))
    galleries           = list(object({
            category      = string
            name          = string
            order         = optional(number)
            resource_type = optional(string)
            type          = optional(string)
        }))
  }))
}
