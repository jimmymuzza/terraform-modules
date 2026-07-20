variable "workspacesweb_browser_settings" {
  description = <<EOT
Map of workspacesweb_browser_settings, attributes below
Required:
    - browser_policy
Optional:
    - additional_encryption_context
    - customer_managed_key
    - region
    - tags
EOT

  type = map(object({
    browser_policy                = string
    additional_encryption_context = optional(map(string))
    customer_managed_key          = optional(string)
    region                        = optional(string)
    tags                          = optional(map(string))
  }))
}
