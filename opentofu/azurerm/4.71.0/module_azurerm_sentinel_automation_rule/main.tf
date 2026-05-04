resource "azurerm_sentinel_automation_rule" "sentinel_automation_rules" {
  for_each = var.sentinel_automation_rules

  display_name               = each.value.display_name
  log_analytics_workspace_id = each.value.log_analytics_workspace_id
  name                       = each.value.name
  order                      = each.value.order
  condition_json             = each.value.condition_json
  enabled                    = each.value.enabled
  expiration                 = each.value.expiration
  triggers_on                = each.value.triggers_on
  triggers_when              = each.value.triggers_when

  dynamic "action_incident" {
    for_each = each.value.action_incident != null ? each.value.action_incident : []
    content {
      order                  = action_incident.value.order
      classification         = action_incident.value.classification
      classification_comment = action_incident.value.classification_comment
      labels                 = action_incident.value.labels
      owner_id               = action_incident.value.owner_id
      severity               = action_incident.value.severity
      status                 = action_incident.value.status
    }
  }

  dynamic "action_incident_task" {
    for_each = each.value.action_incident_task != null ? each.value.action_incident_task : []
    content {
      order       = action_incident_task.value.order
      title       = action_incident_task.value.title
      description = action_incident_task.value.description
    }
  }

  dynamic "action_playbook" {
    for_each = each.value.action_playbook != null ? each.value.action_playbook : []
    content {
      logic_app_id = action_playbook.value.logic_app_id
      order        = action_playbook.value.order
      tenant_id    = action_playbook.value.tenant_id
    }
  }
}
