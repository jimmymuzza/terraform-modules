resource "azurerm_network_manager_verifier_workspace_reachability_analysis_intent" "network_manager_verifier_workspace_reachability_analysis_intents" {
  for_each = var.network_manager_verifier_workspace_reachability_analysis_intents

  destination_resource_id = each.value.destination_resource_id
  name                    = each.value.name
  source_resource_id      = each.value.source_resource_id
  verifier_workspace_id   = each.value.verifier_workspace_id
  description             = each.value.description

  dynamic "ip_traffic" {
    for_each = each.value.ip_traffic != null ? each.value.ip_traffic : []
    content {
      destination_ips   = ip_traffic.value.destination_ips
      destination_ports = ip_traffic.value.destination_ports
      protocols         = ip_traffic.value.protocols
      source_ips        = ip_traffic.value.source_ips
      source_ports      = ip_traffic.value.source_ports
    }
  }
}
