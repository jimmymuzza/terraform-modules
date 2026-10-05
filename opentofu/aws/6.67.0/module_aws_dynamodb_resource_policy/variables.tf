variable "dynamodb_resource_policies" {
  description = <<EOT
Map of dynamodb_resource_policies, attributes below
Required:
    - policy
    - resource_arn
Optional:
    - confirm_remove_self_resource_access
    - region
EOT

  type = map(object({
    policy                              = string
    resource_arn                        = string
    confirm_remove_self_resource_access = optional(bool)
    region                              = optional(string)
  }))
}
