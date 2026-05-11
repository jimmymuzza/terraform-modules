variable "iam_user_policy_attachments_exclusives" {
  description = <<EOT
Map of iam_user_policy_attachments_exclusives, attributes below
Required:
    - policy_arns
    - user_name
EOT

  type = map(object({
    policy_arns = set(string)
    user_name   = string
  }))
}
