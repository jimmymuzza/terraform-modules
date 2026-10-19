variable "iam_group_policy_attachments_exclusives" {
  description = <<EOT
Map of iam_group_policy_attachments_exclusives, attributes below
Required:
    - group_name
    - policy_arns
EOT

  type = map(object({
    group_name  = string
    policy_arns = set(string)
  }))
}
