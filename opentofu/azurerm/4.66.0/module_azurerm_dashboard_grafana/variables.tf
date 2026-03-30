variable "dashboard_grafanas" {
  description = <<EOT
Map of dashboard_grafanas, attributes below
Required:
    - grafana_major_version
    - location
    - name
    - resource_group_name
Optional:
    - api_key_enabled
    - auto_generated_domain_name_label_scope
    - deterministic_outbound_ip_enabled
    - public_network_access_enabled
    - sku
    - tags
    - zone_redundancy_enabled
    - azure_monitor_workspace_integrations
    - identity
    - smtp
EOT

  type = map(object({
    grafana_major_version                  = string
    location                               = string
    name                                   = string
    resource_group_name                    = string
    api_key_enabled                        = optional(bool)
    auto_generated_domain_name_label_scope = optional(string)
    deterministic_outbound_ip_enabled      = optional(bool)
    public_network_access_enabled          = optional(bool)
    sku                                    = optional(string)
    tags                                   = optional(map(string))
    zone_redundancy_enabled                = optional(bool)
    azure_monitor_workspace_integrations   = optional(list(object({
            resource_id = string
        })))
    identity                               = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
    smtp                                   = optional(list(object({
            from_address              = string
            host                      = string
            password                  = string
            start_tls_policy          = string
            user                      = string
            enabled                   = optional(bool)
            from_name                 = optional(string)
            verification_skip_enabled = optional(bool)
        })))
  }))
}
