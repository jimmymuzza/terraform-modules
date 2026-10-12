variable "automation_runtime_environments" {
  description = <<EOT
Map of automation_runtime_environments, attributes below
Required:
    - automation_account_id
    - location
    - name
    - runtime_language
    - runtime_version
Optional:
    - description
    - runtime_default_packages
    - tags
EOT

  type = map(object({
    automation_account_id    = string
    location                 = string
    name                     = string
    runtime_language         = string
    runtime_version          = string
    description              = optional(string)
    runtime_default_packages = optional(map(string))
    tags                     = optional(map(string))
  }))
}
