resource "azurerm_kubernetes_fleet_update_run" "kubernetes_fleet_update_runs" {
  for_each = var.kubernetes_fleet_update_runs

  kubernetes_fleet_manager_id = each.value.kubernetes_fleet_manager_id
  name                        = each.value.name
  fleet_update_strategy_id    = each.value.fleet_update_strategy_id

  dynamic "managed_cluster_update" {
    for_each = each.value.managed_cluster_update != null ? each.value.managed_cluster_update : []
    content {

      dynamic "node_image_selection" {
        for_each = managed_cluster_update.value.node_image_selection != null ? managed_cluster_update.value.node_image_selection : []
        content {
          type = node_image_selection.value.type
        }
      }

      dynamic "upgrade" {
        for_each = managed_cluster_update.value.upgrade != null ? managed_cluster_update.value.upgrade : []
        content {
          type               = upgrade.value.type
          kubernetes_version = upgrade.value.kubernetes_version
        }
      }
    }
  }

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
