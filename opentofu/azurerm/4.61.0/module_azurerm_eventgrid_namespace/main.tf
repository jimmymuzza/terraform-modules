resource "azurerm_eventgrid_namespace" "eventgrid_namespaces" {
  for_each = var.eventgrid_namespaces

  location              = each.value.location
  name                  = each.value.name
  resource_group_name   = each.value.resource_group_name
  capacity              = each.value.capacity
  public_network_access = each.value.public_network_access
  sku                   = each.value.sku
  tags                  = each.value.tags

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "inbound_ip_rule" {
    for_each = each.value.inbound_ip_rule != null ? each.value.inbound_ip_rule : []
    content {
      ip_mask = inbound_ip_rule.value.ip_mask
      action  = inbound_ip_rule.value.action
    }
  }

  dynamic "topic_spaces_configuration" {
    for_each = each.value.topic_spaces_configuration != null ? each.value.topic_spaces_configuration : []
    content {
      alternative_authentication_name_source          = topic_spaces_configuration.value.alternative_authentication_name_source
      maximum_client_sessions_per_authentication_name = topic_spaces_configuration.value.maximum_client_sessions_per_authentication_name
      maximum_session_expiry_in_hours                 = topic_spaces_configuration.value.maximum_session_expiry_in_hours
      route_topic_id                                  = topic_spaces_configuration.value.route_topic_id

      dynamic "dynamic_routing_enrichment" {
        for_each = topic_spaces_configuration.value.dynamic_routing_enrichment != null ? topic_spaces_configuration.value.dynamic_routing_enrichment : []
        content {
          key   = dynamic_routing_enrichment.value.key
          value = dynamic_routing_enrichment.value.value
        }
      }

      dynamic "static_routing_enrichment" {
        for_each = topic_spaces_configuration.value.static_routing_enrichment != null ? topic_spaces_configuration.value.static_routing_enrichment : []
        content {
          key   = static_routing_enrichment.value.key
          value = static_routing_enrichment.value.value
        }
      }
    }
  }
}
