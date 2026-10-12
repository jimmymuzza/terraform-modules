variable "firewall_policies" {
  description = <<EOT
Map of firewall_policies, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - auto_learn_private_ranges_enabled
    - base_policy_id
    - private_ip_ranges
    - sku
    - sql_redirect_allowed
    - tags
    - threat_intelligence_mode
    - dns
    - explicit_proxy
    - identity
    - insights
    - intrusion_detection
    - threat_intelligence_allowlist
    - tls_certificate
EOT

  type = map(object({
    location                          = string
    name                              = string
    resource_group_name               = string
    auto_learn_private_ranges_enabled = optional(bool)
    base_policy_id                    = optional(string)
    private_ip_ranges                 = optional(list(string))
    sku                               = optional(string)
    sql_redirect_allowed              = optional(bool)
    tags                              = optional(map(string))
    threat_intelligence_mode          = optional(string)
    dns                               = optional(list(object({
            proxy_enabled = optional(bool)
            servers       = optional(list(string))
        })))
    explicit_proxy                    = optional(list(object({
            enable_pac_file = optional(bool)
            enabled         = optional(bool)
            http_port       = optional(number)
            https_port      = optional(number)
            pac_file        = optional(string)
            pac_file_port   = optional(number)
        })))
    identity                          = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
    insights                          = optional(list(object({
            default_log_analytics_workspace_id = string
            enabled                            = bool
            retention_in_days                  = optional(number)
            log_analytics_workspace            = optional(list(object({
                firewall_location = string
            })))
        })))
    intrusion_detection               = optional(list(object({
            mode                = optional(string)
            private_ranges      = optional(list(string))
            signature_overrides = optional(list(object({
                state = optional(string)
            })))
            traffic_bypass      = optional(list(object({
                name                  = string
                protocol              = string
                description           = optional(string)
                destination_addresses = optional(set(string))
                destination_ip_groups = optional(set(string))
                destination_ports     = optional(set(string))
                source_addresses      = optional(set(string))
                source_ip_groups      = optional(set(string))
            })))
        })))
    threat_intelligence_allowlist     = optional(list(object({
            fqdns        = optional(set(string))
            ip_addresses = optional(set(string))
        })))
    tls_certificate                   = optional(list(object({
            key_vault_secret_id = string
            name                = string
        })))
  }))
}
