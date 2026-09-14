resource "aws_backup_restore_testing_selection" "backup_restore_testing_selections" {
  for_each = var.backup_restore_testing_selections

  iam_role_arn               = each.value.iam_role_arn
  name                       = each.value.name
  protected_resource_type    = each.value.protected_resource_type
  restore_testing_plan_name  = each.value.restore_testing_plan_name
  protected_resource_arns    = each.value.protected_resource_arns
  region                     = each.value.region
  restore_metadata_overrides = each.value.restore_metadata_overrides
  validation_window_hours    = each.value.validation_window_hours

  dynamic "protected_resource_conditions" {
    for_each = each.value.protected_resource_conditions != null ? each.value.protected_resource_conditions : []
    content {

      dynamic "string_equals" {
        for_each = protected_resource_conditions.value.string_equals != null ? protected_resource_conditions.value.string_equals : []
        content {
          key   = string_equals.value.key
          value = string_equals.value.value
        }
      }

      dynamic "string_not_equals" {
        for_each = protected_resource_conditions.value.string_not_equals != null ? protected_resource_conditions.value.string_not_equals : []
        content {
          key   = string_not_equals.value.key
          value = string_not_equals.value.value
        }
      }
    }
  }
}
