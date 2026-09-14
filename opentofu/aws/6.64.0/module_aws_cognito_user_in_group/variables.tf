variable "cognito_user_in_groups" {
  description = <<EOT
Map of cognito_user_in_groups, attributes below
Required:
    - group_name
    - user_pool_id
    - username
Optional:
    - region
EOT

  type = map(object({
    group_name   = string
    user_pool_id = string
    username     = string
    region       = optional(string)
  }))
}
