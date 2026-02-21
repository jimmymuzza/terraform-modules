variable "cloudwatch_log_resource_policies" {
  description = <<EOT
Map of cloudwatch_log_resource_policies, attributes below
Required:
    - policy_document
    - policy_name
Optional:
    - region
EOT

  type = map(object({
    policy_document = string
    policy_name     = string
    region          = optional(string)
  }))
}
