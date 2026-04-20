resource "azurerm_container_registry_task_schedule_run_now" "container_registry_task_schedule_run_nows" {
  for_each = var.container_registry_task_schedule_run_nows

  container_registry_task_id = each.value.container_registry_task_id
}
