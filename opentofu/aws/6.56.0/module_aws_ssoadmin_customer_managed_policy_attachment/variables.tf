variable "ssoadmin_customer_managed_policy_attachments" {
  description = <<EOT
Map of ssoadmin_customer_managed_policy_attachments, attributes below
Required:
    - instance_arn
    - permission_set_arn
    - customer_managed_policy_reference
Optional:
    - region
EOT

  type = map(object({
    instance_arn                      = string
    permission_set_arn                = string
    region                            = optional(string)
    customer_managed_policy_reference = list(object({
            name = string
            path = optional(string)
        }))
  }))
}
