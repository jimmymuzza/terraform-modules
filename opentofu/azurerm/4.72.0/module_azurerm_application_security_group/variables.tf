variable "application_security_groups" {
  description = <<EOT
Map of application_security_groups, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - tags
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    tags                = optional(map(string))
  }))
}
