resource "azurerm_kubernetes_fleet_update_strategy" "kubernetes_fleet_update_strategies" {
  for_each = var.kubernetes_fleet_update_strategies

  kubernetes_fleet_manager_id = each.value.kubernetes_fleet_manager_id
  name                        = each.value.name

  dynamic "stage" {
    for_each = each.value.stage != null ? each.value.stage : []
    content {
      name                        = stage.value.name
      after_stage_wait_in_seconds = stage.value.after_stage_wait_in_seconds

      dynamic "group" {
        for_each = stage.value.group != null ? stage.value.group : []
        content {
          name = group.value.name
        }
      }
    }
  }
}
