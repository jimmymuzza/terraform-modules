variable "portal_tenant_configurations" {
  description = <<EOT
Map of portal_tenant_configurations, attributes below
Required:
    - private_markdown_storage_enforced
EOT

  type = map(object({
    private_markdown_storage_enforced = bool
  }))
}
