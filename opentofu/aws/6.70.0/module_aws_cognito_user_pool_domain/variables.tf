variable "cognito_user_pool_domains" {
  description = <<EOT
Map of cognito_user_pool_domains, attributes below
Required:
    - domain
    - user_pool_id
Optional:
    - certificate_arn
    - managed_login_version
    - region
EOT

  type = map(object({
    domain                = string
    user_pool_id          = string
    certificate_arn       = optional(string)
    managed_login_version = optional(number)
    region                = optional(string)
  }))
}
