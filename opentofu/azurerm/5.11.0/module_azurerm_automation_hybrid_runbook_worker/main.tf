resource "azurerm_automation_hybrid_runbook_worker" "automation_hybrid_runbook_workers" {
  for_each = var.automation_hybrid_runbook_workers

  automation_account_name = each.value.automation_account_name
  resource_group_name     = each.value.resource_group_name
  vm_resource_id          = each.value.vm_resource_id
  worker_group_name       = each.value.worker_group_name
  worker_id               = each.value.worker_id
}
