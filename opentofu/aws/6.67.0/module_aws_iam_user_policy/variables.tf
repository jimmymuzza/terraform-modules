variable "iam_user_policies" {
  description = <<EOT
Map of iam_user_policies, attributes below
Required:
    - policy
    - user
Optional:
    - name
    - name_prefix
EOT

  type = map(object({
    policy      = string
    user        = string
    name        = optional(string)
    name_prefix = optional(string)
  }))
}
