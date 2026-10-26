variable "automation_dsc_configurations" {
  description = <<EOT
Map of automation_dsc_configurations, attributes below
Required:
    - automation_account_name
    - content_embedded
    - location
    - name
    - resource_group_name
Optional:
    - description
    - log_verbose
    - tags
EOT

  type = map(object({
    automation_account_name = string
    content_embedded        = string
    location                = string
    name                    = string
    resource_group_name     = string
    description             = optional(string)
    log_verbose             = optional(bool)
    tags                    = optional(map(string))
  }))
}
