variable "api_management_users" {
  description = <<EOT
Map of api_management_users, attributes below
Required:
    - api_management_name
    - email
    - first_name
    - last_name
    - resource_group_name
    - user_id
Optional:
    - confirmation
    - note
    - password
    - state
EOT

  type = map(object({
    api_management_name = string
    email               = string
    first_name          = string
    last_name           = string
    resource_group_name = string
    user_id             = string
    confirmation        = optional(string)
    note                = optional(string)
    password            = optional(string)
    state               = optional(string)
  }))
}
