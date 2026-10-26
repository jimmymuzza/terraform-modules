resource "azurerm_batch_job" "batch_jobs" {
  for_each = var.batch_jobs

  batch_pool_id                 = each.value.batch_pool_id
  name                          = each.value.name
  common_environment_properties = each.value.common_environment_properties
  display_name                  = each.value.display_name
  priority                      = each.value.priority
  task_retry_maximum            = each.value.task_retry_maximum
}
