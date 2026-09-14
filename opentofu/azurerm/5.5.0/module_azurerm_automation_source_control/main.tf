resource "azurerm_automation_source_control" "automation_source_controls" {
  for_each = var.automation_source_controls

  automation_account_id   = each.value.automation_account_id
  folder_path             = each.value.folder_path
  name                    = each.value.name
  repository_url          = each.value.repository_url
  source_control_type     = each.value.source_control_type
  automatic_sync          = each.value.automatic_sync
  branch                  = each.value.branch
  description             = each.value.description
  publish_runbook_enabled = each.value.publish_runbook_enabled

  dynamic "security" {
    for_each = each.value.security != null ? each.value.security : []
    content {
      token         = security.value.token
      token_type    = security.value.token_type
      refresh_token = security.value.refresh_token
    }
  }
}
