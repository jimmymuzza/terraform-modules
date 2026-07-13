variable "spring_cloud_dev_tool_portals" {
  description = <<EOT
Map of spring_cloud_dev_tool_portals, attributes below
Required:
    - name
    - spring_cloud_service_id
Optional:
    - application_accelerator_enabled
    - application_live_view_enabled
    - public_network_access_enabled
    - sso
EOT

  type = map(object({
    name                            = string
    spring_cloud_service_id         = string
    application_accelerator_enabled = optional(bool)
    application_live_view_enabled   = optional(bool)
    public_network_access_enabled   = optional(bool)
    sso                             = optional(list(object({
            client_id     = optional(string)
            client_secret = optional(string)
            metadata_url  = optional(string)
            scope         = optional(set(string))
        })))
  }))
}
