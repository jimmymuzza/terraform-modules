resource "azurerm_dashboard_grafana" "dashboard_grafanas" {
  for_each = var.dashboard_grafanas

  grafana_major_version                  = each.value.grafana_major_version
  location                               = each.value.location
  name                                   = each.value.name
  resource_group_name                    = each.value.resource_group_name
  api_key_enabled                        = each.value.api_key_enabled
  auto_generated_domain_name_label_scope = each.value.auto_generated_domain_name_label_scope
  deterministic_outbound_ip_enabled      = each.value.deterministic_outbound_ip_enabled
  public_network_access_enabled          = each.value.public_network_access_enabled
  sku                                    = each.value.sku
  tags                                   = each.value.tags
  zone_redundancy_enabled                = each.value.zone_redundancy_enabled

  dynamic "azure_monitor_workspace_integrations" {
    for_each = each.value.azure_monitor_workspace_integrations != null ? each.value.azure_monitor_workspace_integrations : []
    content {
      resource_id = azure_monitor_workspace_integrations.value.resource_id
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "smtp" {
    for_each = each.value.smtp != null ? each.value.smtp : []
    content {
      from_address              = smtp.value.from_address
      host                      = smtp.value.host
      password                  = smtp.value.password
      start_tls_policy          = smtp.value.start_tls_policy
      user                      = smtp.value.user
      enabled                   = smtp.value.enabled
      from_name                 = smtp.value.from_name
      verification_skip_enabled = smtp.value.verification_skip_enabled
    }
  }
}
