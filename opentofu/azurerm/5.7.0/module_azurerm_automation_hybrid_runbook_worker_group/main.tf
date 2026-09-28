resource "azurerm_automation_hybrid_runbook_worker_group" "automation_hybrid_runbook_worker_groups" {
  for_each = var.automation_hybrid_runbook_worker_groups

  automation_account_name = each.value.automation_account_name
  name                    = each.value.name
  resource_group_name     = each.value.resource_group_name
  credential_name         = each.value.credential_name
}
