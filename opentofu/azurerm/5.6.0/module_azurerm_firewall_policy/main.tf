resource "azurerm_firewall_policy" "firewall_policies" {
  for_each = var.firewall_policies

  location                          = each.value.location
  name                              = each.value.name
  resource_group_name               = each.value.resource_group_name
  auto_learn_private_ranges_enabled = each.value.auto_learn_private_ranges_enabled
  base_policy_id                    = each.value.base_policy_id
  private_ip_ranges                 = each.value.private_ip_ranges
  sku                               = each.value.sku
  sql_redirect_allowed              = each.value.sql_redirect_allowed
  tags                              = each.value.tags
  threat_intelligence_mode          = each.value.threat_intelligence_mode

  dynamic "dns" {
    for_each = each.value.dns != null ? each.value.dns : []
    content {
      proxy_enabled = dns.value.proxy_enabled
      servers       = dns.value.servers
    }
  }

  dynamic "explicit_proxy" {
    for_each = each.value.explicit_proxy != null ? each.value.explicit_proxy : []
    content {
      enable_pac_file = explicit_proxy.value.enable_pac_file
      enabled         = explicit_proxy.value.enabled
      http_port       = explicit_proxy.value.http_port
      https_port      = explicit_proxy.value.https_port
      pac_file        = explicit_proxy.value.pac_file
      pac_file_port   = explicit_proxy.value.pac_file_port
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "insights" {
    for_each = each.value.insights != null ? each.value.insights : []
    content {
      default_log_analytics_workspace_id = insights.value.default_log_analytics_workspace_id
      enabled                            = insights.value.enabled
      retention_in_days                  = insights.value.retention_in_days

      dynamic "log_analytics_workspace" {
        for_each = insights.value.log_analytics_workspace != null ? insights.value.log_analytics_workspace : []
        content {
          firewall_location = log_analytics_workspace.value.firewall_location
        }
      }
    }
  }

  dynamic "intrusion_detection" {
    for_each = each.value.intrusion_detection != null ? each.value.intrusion_detection : []
    content {
      mode           = intrusion_detection.value.mode
      private_ranges = intrusion_detection.value.private_ranges

      dynamic "signature_overrides" {
        for_each = intrusion_detection.value.signature_overrides != null ? intrusion_detection.value.signature_overrides : []
        content {
          state = signature_overrides.value.state
        }
      }

      dynamic "traffic_bypass" {
        for_each = intrusion_detection.value.traffic_bypass != null ? intrusion_detection.value.traffic_bypass : []
        content {
          name                  = traffic_bypass.value.name
          protocol              = traffic_bypass.value.protocol
          description           = traffic_bypass.value.description
          destination_addresses = traffic_bypass.value.destination_addresses
          destination_ip_groups = traffic_bypass.value.destination_ip_groups
          destination_ports     = traffic_bypass.value.destination_ports
          source_addresses      = traffic_bypass.value.source_addresses
          source_ip_groups      = traffic_bypass.value.source_ip_groups
        }
      }
    }
  }

  dynamic "threat_intelligence_allowlist" {
    for_each = each.value.threat_intelligence_allowlist != null ? each.value.threat_intelligence_allowlist : []
    content {
      fqdns        = threat_intelligence_allowlist.value.fqdns
      ip_addresses = threat_intelligence_allowlist.value.ip_addresses
    }
  }

  dynamic "tls_certificate" {
    for_each = each.value.tls_certificate != null ? each.value.tls_certificate : []
    content {
      key_vault_secret_id = tls_certificate.value.key_vault_secret_id
      name                = tls_certificate.value.name
    }
  }
}
