resource "azurerm_automation_watcher" "automation_watchers" {
  for_each = var.automation_watchers

  automation_account_id          = each.value.automation_account_id
  execution_frequency_in_seconds = each.value.execution_frequency_in_seconds
  location                       = each.value.location
  name                           = each.value.name
  script_name                    = each.value.script_name
  script_run_on                  = each.value.script_run_on
  description                    = each.value.description
  etag                           = each.value.etag
  script_parameters              = each.value.script_parameters
  tags                           = each.value.tags
}
