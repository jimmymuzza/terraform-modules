variable "ssoadmin_permissions_boundary_attachments" {
  description = <<EOT
Map of ssoadmin_permissions_boundary_attachments, attributes below
Required:
    - instance_arn
    - permission_set_arn
    - permissions_boundary
Optional:
    - region
EOT

  type = map(object({
    instance_arn         = string
    permission_set_arn   = string
    region               = optional(string)
    permissions_boundary = list(object({
            managed_policy_arn                = optional(string)
            customer_managed_policy_reference = optional(list(object({
                name = string
                path = optional(string)
            })))
        }))
  }))
}
