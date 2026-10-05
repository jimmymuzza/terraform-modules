variable "ssoadmin_permission_set_inline_policies" {
  description = <<EOT
Map of ssoadmin_permission_set_inline_policies, attributes below
Required:
    - inline_policy
    - instance_arn
    - permission_set_arn
Optional:
    - region
EOT

  type = map(object({
    inline_policy      = string
    instance_arn       = string
    permission_set_arn = string
    region             = optional(string)
  }))
}
