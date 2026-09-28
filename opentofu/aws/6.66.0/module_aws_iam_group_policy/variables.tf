variable "iam_group_policies" {
  description = <<EOT
Map of iam_group_policies, attributes below
Required:
    - group
    - policy
Optional:
    - name
    - name_prefix
EOT

  type = map(object({
    group       = string
    policy      = string
    name        = optional(string)
    name_prefix = optional(string)
  }))
}
