variable "iam_role_policy_attachments_exclusives" {
  description = <<EOT
Map of iam_role_policy_attachments_exclusives, attributes below
Required:
    - policy_arns
    - role_name
EOT

  type = map(object({
    policy_arns = set(string)
    role_name   = string
  }))
}
