variable "workspacesweb_portals" {
  description = <<EOT
Map of workspacesweb_portals, attributes below
Optional:
    - additional_encryption_context
    - authentication_type
    - browser_settings_arn
    - customer_managed_key
    - display_name
    - instance_type
    - max_concurrent_sessions
    - region
    - tags
EOT

  type = map(object({
    additional_encryption_context = optional(map(string))
    authentication_type           = optional(string)
    browser_settings_arn          = optional(string)
    customer_managed_key          = optional(string)
    display_name                  = optional(string)
    instance_type                 = optional(string)
    max_concurrent_sessions       = optional(number)
    region                        = optional(string)
    tags                          = optional(map(string))
  }))
}
