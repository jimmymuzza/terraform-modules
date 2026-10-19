variable "iam_user_policy_attachments" {
  description = <<EOT
Map of iam_user_policy_attachments, attributes below
Required:
    - policy_arn
    - user
EOT

  type = map(object({
    policy_arn = string
    user       = string
  }))
}
