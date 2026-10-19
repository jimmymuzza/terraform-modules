variable "iam_group_policy_attachments" {
  description = <<EOT
Map of iam_group_policy_attachments, attributes below
Required:
    - group
    - policy_arn
EOT

  type = map(object({
    group      = string
    policy_arn = string
  }))
}
