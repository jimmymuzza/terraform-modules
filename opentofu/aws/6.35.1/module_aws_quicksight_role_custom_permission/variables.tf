variable "quicksight_role_custom_permissions" {
  description = <<EOT
Map of quicksight_role_custom_permissions, attributes below
Required:
    - custom_permissions_name
    - role
Optional:
    - aws_account_id
    - namespace
    - region
EOT

  type = map(object({
    custom_permissions_name = string
    role                    = string
    aws_account_id          = optional(string)
    namespace               = optional(string)
    region                  = optional(string)
  }))
}
