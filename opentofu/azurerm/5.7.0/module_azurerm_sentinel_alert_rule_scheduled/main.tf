resource "azurerm_sentinel_alert_rule_scheduled" "sentinel_alert_rule_scheduleds" {
  for_each = var.sentinel_alert_rule_scheduleds

  display_name                = each.value.display_name
  log_analytics_workspace_id  = each.value.log_analytics_workspace_id
  name                        = each.value.name
  query                       = each.value.query
  severity                    = each.value.severity
  alert_rule_template_guid    = each.value.alert_rule_template_guid
  alert_rule_template_version = each.value.alert_rule_template_version
  custom_details              = each.value.custom_details
  description                 = each.value.description
  enabled                     = each.value.enabled
  query_frequency             = each.value.query_frequency
  query_period                = each.value.query_period
  suppression_duration        = each.value.suppression_duration
  suppression_enabled         = each.value.suppression_enabled
  tactics                     = each.value.tactics
  techniques                  = each.value.techniques
  trigger_operator            = each.value.trigger_operator
  trigger_threshold           = each.value.trigger_threshold

  dynamic "alert_details_override" {
    for_each = each.value.alert_details_override != null ? each.value.alert_details_override : []
    content {
      description_format   = alert_details_override.value.description_format
      display_name_format  = alert_details_override.value.display_name_format
      severity_column_name = alert_details_override.value.severity_column_name
      tactics_column_name  = alert_details_override.value.tactics_column_name

      dynamic "dynamic_property" {
        for_each = alert_details_override.value.dynamic_property != null ? alert_details_override.value.dynamic_property : []
        content {
          name  = dynamic_property.value.name
          value = dynamic_property.value.value
        }
      }
    }
  }

  dynamic "entity_mapping" {
    for_each = each.value.entity_mapping != null ? each.value.entity_mapping : []
    content {
      entity_type = entity_mapping.value.entity_type

      dynamic "field_mapping" {
        for_each = entity_mapping.value.field_mapping != null ? entity_mapping.value.field_mapping : []
        content {
          column_name = field_mapping.value.column_name
          identifier  = field_mapping.value.identifier
        }
      }
    }
  }

  dynamic "event_grouping" {
    for_each = each.value.event_grouping != null ? each.value.event_grouping : []
    content {
      aggregation_method = event_grouping.value.aggregation_method
    }
  }

  dynamic "incident" {
    for_each = each.value.incident != null ? each.value.incident : []
    content {
      create_incident_enabled = incident.value.create_incident_enabled

      dynamic "grouping" {
        for_each = incident.value.grouping != null ? incident.value.grouping : []
        content {
          by_alert_details        = grouping.value.by_alert_details
          by_custom_details       = grouping.value.by_custom_details
          by_entities             = grouping.value.by_entities
          enabled                 = grouping.value.enabled
          entity_matching_method  = grouping.value.entity_matching_method
          lookback_duration       = grouping.value.lookback_duration
          reopen_closed_incidents = grouping.value.reopen_closed_incidents
        }
      }
    }
  }

  dynamic "sentinel_entity_mapping" {
    for_each = each.value.sentinel_entity_mapping != null ? each.value.sentinel_entity_mapping : []
    content {
      column_name = sentinel_entity_mapping.value.column_name
    }
  }
}
