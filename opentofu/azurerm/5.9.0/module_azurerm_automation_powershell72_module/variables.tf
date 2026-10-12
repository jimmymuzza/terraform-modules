variable "automation_powershell72_modules" {
  description = <<EOT
Map of automation_powershell72_modules, attributes below
Required:
    - automation_account_id
    - name
    - module_link
Optional:
    - tags
EOT

  type = map(object({
    automation_account_id = string
    name                  = string
    tags                  = optional(map(string))
    module_link           = list(object({
            uri  = string
            hash = optional(list(object({
                algorithm = string
                value     = string
            })))
        }))
  }))
}
