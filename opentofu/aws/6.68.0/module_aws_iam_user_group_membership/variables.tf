variable "iam_user_group_memberships" {
  description = <<EOT
Map of iam_user_group_memberships, attributes below
Required:
    - groups
    - user
EOT

  type = map(object({
    groups = set(string)
    user   = string
  }))
}
