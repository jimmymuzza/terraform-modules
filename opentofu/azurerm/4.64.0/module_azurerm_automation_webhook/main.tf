resource "azurerm_automation_webhook" "automation_webhooks" {
  for_each = var.automation_webhooks

  automation_account_name = each.value.automation_account_name
  expiry_time             = each.value.expiry_time
  name                    = each.value.name
  resource_group_name     = each.value.resource_group_name
  runbook_name            = each.value.runbook_name
  enabled                 = each.value.enabled
  parameters              = each.value.parameters
  run_on_worker_group     = each.value.run_on_worker_group
  uri                     = each.value.uri
}
