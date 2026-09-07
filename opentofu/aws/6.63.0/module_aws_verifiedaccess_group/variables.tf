variable "verifiedaccess_groups" {
  description = <<EOT
Map of verifiedaccess_groups, attributes below
Required:
    - verifiedaccess_instance_id
Optional:
    - description
    - policy_document
    - region
    - tags
    - tags_all
    - sse_configuration
EOT

  type = map(object({
    verifiedaccess_instance_id = string
    description                = optional(string)
    policy_document            = optional(string)
    region                     = optional(string)
    tags                       = optional(map(string))
    tags_all                   = optional(map(string))
    sse_configuration          = optional(list(object({
            customer_managed_key_enabled = optional(bool)
            kms_key_arn                  = optional(string)
        })))
  }))
}
