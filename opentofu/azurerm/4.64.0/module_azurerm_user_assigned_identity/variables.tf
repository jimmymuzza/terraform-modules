variable "user_assigned_identities" {
  description = <<EOT
Map of user_assigned_identities, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - isolation_scope
    - tags
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    isolation_scope     = optional(string)
    tags                = optional(map(string))
  }))
}
