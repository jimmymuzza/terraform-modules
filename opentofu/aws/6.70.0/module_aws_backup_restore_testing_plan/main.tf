resource "aws_backup_restore_testing_plan" "backup_restore_testing_plans" {
  for_each = var.backup_restore_testing_plans

  name                         = each.value.name
  schedule_expression          = each.value.schedule_expression
  region                       = each.value.region
  schedule_expression_timezone = each.value.schedule_expression_timezone
  start_window_hours           = each.value.start_window_hours
  tags                         = each.value.tags

  dynamic "recovery_point_selection" {
    for_each = each.value.recovery_point_selection != null ? each.value.recovery_point_selection : []
    content {
      algorithm             = recovery_point_selection.value.algorithm
      include_vaults        = recovery_point_selection.value.include_vaults
      recovery_point_types  = recovery_point_selection.value.recovery_point_types
      exclude_vaults        = recovery_point_selection.value.exclude_vaults
      selection_window_days = recovery_point_selection.value.selection_window_days
    }
  }
}
