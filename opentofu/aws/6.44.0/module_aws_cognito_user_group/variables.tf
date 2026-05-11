variable "cognito_user_groups" {
  description = <<EOT
Map of cognito_user_groups, attributes below
Required:
    - name
    - user_pool_id
Optional:
    - description
    - precedence
    - region
    - role_arn
EOT

  type = map(object({
    name         = string
    user_pool_id = string
    description  = optional(string)
    precedence   = optional(number)
    region       = optional(string)
    role_arn     = optional(string)
  }))
}
