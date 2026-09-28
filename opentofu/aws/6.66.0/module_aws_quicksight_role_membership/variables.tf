variable "quicksight_role_memberships" {
  description = <<EOT
Map of quicksight_role_memberships, attributes below
Required:
    - member_name
    - role
Optional:
    - aws_account_id
    - namespace
    - region
EOT

  type = map(object({
    member_name    = string
    role           = string
    aws_account_id = optional(string)
    namespace      = optional(string)
    region         = optional(string)
  }))
}
