variable "quicksight_users" {
  description = <<EOT
Map of quicksight_users, attributes below
Required:
    - email
    - identity_type
    - user_role
Optional:
    - aws_account_id
    - iam_arn
    - namespace
    - region
    - session_name
    - user_name
EOT

  type = map(object({
    email          = string
    identity_type  = string
    user_role      = string
    aws_account_id = optional(string)
    iam_arn        = optional(string)
    namespace      = optional(string)
    region         = optional(string)
    session_name   = optional(string)
    user_name      = optional(string)
  }))
}
