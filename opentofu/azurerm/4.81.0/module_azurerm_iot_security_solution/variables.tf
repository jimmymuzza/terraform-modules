variable "iot_security_solutions" {
  description = <<EOT
Map of iot_security_solutions, attributes below
Required:
    - display_name
    - iothub_ids
    - location
    - name
    - resource_group_name
Optional:
    - disabled_data_sources
    - enabled
    - events_to_export
    - log_analytics_workspace_id
    - log_unmasked_ips_enabled
    - query_for_resources
    - query_subscription_ids
    - tags
    - additional_workspace
    - recommendations_enabled
EOT

  type = map(object({
    display_name               = string
    iothub_ids                 = set(string)
    location                   = string
    name                       = string
    resource_group_name        = string
    disabled_data_sources      = optional(set(string))
    enabled                    = optional(bool)
    events_to_export           = optional(set(string))
    log_analytics_workspace_id = optional(string)
    log_unmasked_ips_enabled   = optional(bool)
    query_for_resources        = optional(string)
    query_subscription_ids     = optional(set(string))
    tags                       = optional(map(string))
    additional_workspace       = optional(set(object({
            data_types   = set(string)
            workspace_id = string
        })))
    recommendations_enabled    = optional(list(object({
            acr_authentication               = optional(bool)
            agent_send_unutilized_msg        = optional(bool)
            baseline                         = optional(bool)
            edge_hub_mem_optimize            = optional(bool)
            edge_logging_option              = optional(bool)
            inconsistent_module_settings     = optional(bool)
            install_agent                    = optional(bool)
            ip_filter_deny_all               = optional(bool)
            ip_filter_permissive_rule        = optional(bool)
            open_ports                       = optional(bool)
            permissive_firewall_policy       = optional(bool)
            permissive_input_firewall_rules  = optional(bool)
            permissive_output_firewall_rules = optional(bool)
            privileged_docker_options        = optional(bool)
            shared_credentials               = optional(bool)
            vulnerable_tls_cipher_suite      = optional(bool)
        })))
  }))
}
