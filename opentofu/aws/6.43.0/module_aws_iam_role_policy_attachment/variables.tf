variable "iam_role_policy_attachments" {
  description = <<EOT
Map of iam_role_policy_attachments, attributes below
Required:
    - policy_arn
    - role
EOT

  type = map(object({
    policy_arn = string
    role       = string
  }))
}
