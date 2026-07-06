variable "ssoadmin_customer_managed_policy_attachments_exclusives" {
  description = <<EOT
Map of ssoadmin_customer_managed_policy_attachments_exclusives, attributes below
Required:
    - instance_arn
    - permission_set_arn
Optional:
    - region
    - customer_managed_policy_reference
EOT

  type = map(object({
    instance_arn                      = string
    permission_set_arn                = string
    region                            = optional(string)
    customer_managed_policy_reference = optional(list(object({
            name = string
            path = optional(string)
        })))
  }))
}
