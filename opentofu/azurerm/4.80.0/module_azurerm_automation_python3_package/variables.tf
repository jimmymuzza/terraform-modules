variable "automation_python3_packages" {
  description = <<EOT
Map of automation_python3_packages, attributes below
Required:
    - automation_account_name
    - content_uri
    - name
    - resource_group_name
Optional:
    - content_version
    - hash_algorithm
    - hash_value
    - tags
EOT

  type = map(object({
    automation_account_name = string
    content_uri             = string
    name                    = string
    resource_group_name     = string
    content_version         = optional(string)
    hash_algorithm          = optional(string)
    hash_value              = optional(string)
    tags                    = optional(map(string))
  }))
}
