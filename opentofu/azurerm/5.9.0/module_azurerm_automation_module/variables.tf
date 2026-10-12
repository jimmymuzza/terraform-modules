variable "automation_modules" {
  description = <<EOT
Map of automation_modules, attributes below
Required:
    - automation_account_name
    - name
    - resource_group_name
    - module_link
EOT

  type = map(object({
    automation_account_name = string
    name                    = string
    resource_group_name     = string
    module_link             = list(object({
            uri  = string
            hash = optional(list(object({
                algorithm = string
                value     = string
            })))
        }))
  }))
}
