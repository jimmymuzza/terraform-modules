variable "api_management_group_users" {
  description = <<EOT
Map of api_management_group_users, attributes below
Required:
    - api_management_name
    - group_name
    - resource_group_name
    - user_id
EOT

  type = map(object({
    api_management_name = string
    group_name          = string
    resource_group_name = string
    user_id             = string
  }))
}
