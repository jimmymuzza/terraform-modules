variable "iam_group_memberships" {
  description = <<EOT
Map of iam_group_memberships, attributes below
Required:
    - group
    - name
    - users
EOT

  type = map(object({
    group = string
    name  = string
    users = set(string)
  }))
}
