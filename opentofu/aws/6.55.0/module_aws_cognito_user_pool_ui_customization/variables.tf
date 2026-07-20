variable "cognito_user_pool_ui_customizations" {
  description = <<EOT
Map of cognito_user_pool_ui_customizations, attributes below
Required:
    - user_pool_id
Optional:
    - client_id
    - css
    - image_file
    - region
EOT

  type = map(object({
    user_pool_id = string
    client_id    = optional(string)
    css          = optional(string)
    image_file   = optional(string)
    region       = optional(string)
  }))
}
