variable "iam_policy_attachments" {
  description = <<EOT
Map of iam_policy_attachments, attributes below
Required:
    - name
    - policy_arn
Optional:
    - groups
    - roles
    - users
EOT

  type = map(object({
    name       = string
    policy_arn = string
    groups     = optional(set(string))
    roles      = optional(set(string))
    users      = optional(set(string))
  }))
}
