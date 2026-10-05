variable "quicksight_user_custom_permissions" {
  description = <<EOT
Map of quicksight_user_custom_permissions, attributes below
Required:
    - custom_permissions_name
    - user_name
Optional:
    - aws_account_id
    - namespace
    - region
EOT

  type = map(object({
    custom_permissions_name = string
    user_name               = string
    aws_account_id          = optional(string)
    namespace               = optional(string)
    region                  = optional(string)
  }))
}
