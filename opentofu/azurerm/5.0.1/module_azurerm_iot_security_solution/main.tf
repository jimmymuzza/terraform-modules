resource "azurerm_iot_security_solution" "iot_security_solutions" {
  for_each = var.iot_security_solutions

  display_name               = each.value.display_name
  iothub_ids                 = each.value.iothub_ids
  location                   = each.value.location
  name                       = each.value.name
  resource_group_name        = each.value.resource_group_name
  disabled_data_sources      = each.value.disabled_data_sources
  enabled                    = each.value.enabled
  events_to_export           = each.value.events_to_export
  log_analytics_workspace_id = each.value.log_analytics_workspace_id
  log_unmasked_ips_enabled   = each.value.log_unmasked_ips_enabled
  query_for_resources        = each.value.query_for_resources
  query_subscription_ids     = each.value.query_subscription_ids
  tags                       = each.value.tags

  dynamic "additional_workspace" {
    for_each = each.value.additional_workspace != null ? each.value.additional_workspace : []
    content {
      data_types   = additional_workspace.value.data_types
      workspace_id = additional_workspace.value.workspace_id
    }
  }

  dynamic "recommendations" {
    for_each = each.value.recommendations != null ? each.value.recommendations : []
    content {
      acr_authentication               = recommendations.value.acr_authentication
      agent_send_unutilized_msg        = recommendations.value.agent_send_unutilized_msg
      baseline                         = recommendations.value.baseline
      edge_hub_mem_optimize            = recommendations.value.edge_hub_mem_optimize
      edge_logging_option              = recommendations.value.edge_logging_option
      inconsistent_module_settings     = recommendations.value.inconsistent_module_settings
      install_agent                    = recommendations.value.install_agent
      ip_filter_deny_all               = recommendations.value.ip_filter_deny_all
      ip_filter_permissive_rule        = recommendations.value.ip_filter_permissive_rule
      open_ports                       = recommendations.value.open_ports
      permissive_firewall_policy       = recommendations.value.permissive_firewall_policy
      permissive_input_firewall_rules  = recommendations.value.permissive_input_firewall_rules
      permissive_output_firewall_rules = recommendations.value.permissive_output_firewall_rules
      privileged_docker_options        = recommendations.value.privileged_docker_options
      shared_credentials               = recommendations.value.shared_credentials
      vulnerable_tls_cipher_suite      = recommendations.value.vulnerable_tls_cipher_suite
    }
  }
}
