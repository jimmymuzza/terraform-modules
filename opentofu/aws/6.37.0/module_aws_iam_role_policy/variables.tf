variable "iam_role_policies" {
  description = <<EOT
Map of iam_role_policies, attributes below
Required:
    - policy
    - role
Optional:
    - name
    - name_prefix
EOT

  type = map(object({
    policy      = string
    role        = string
    name        = optional(string)
    name_prefix = optional(string)
  }))
}
