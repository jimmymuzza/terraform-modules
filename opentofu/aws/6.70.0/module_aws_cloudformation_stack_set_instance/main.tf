resource "aws_cloudformation_stack_set_instance" "cloudformation_stack_set_instances" {
  for_each = var.cloudformation_stack_set_instances

  stack_set_name            = each.value.stack_set_name
  account_id                = each.value.account_id
  call_as                   = each.value.call_as
  parameter_overrides       = each.value.parameter_overrides
  region                    = each.value.region
  retain_stack              = each.value.retain_stack
  stack_set_instance_region = each.value.stack_set_instance_region

  dynamic "deployment_targets" {
    for_each = each.value.deployment_targets != null ? each.value.deployment_targets : []
    content {
      account_filter_type     = deployment_targets.value.account_filter_type
      accounts                = deployment_targets.value.accounts
      accounts_url            = deployment_targets.value.accounts_url
      organizational_unit_ids = deployment_targets.value.organizational_unit_ids
    }
  }

  dynamic "operation_preferences" {
    for_each = each.value.operation_preferences != null ? each.value.operation_preferences : []
    content {
      concurrency_mode             = operation_preferences.value.concurrency_mode
      failure_tolerance_count      = operation_preferences.value.failure_tolerance_count
      failure_tolerance_percentage = operation_preferences.value.failure_tolerance_percentage
      max_concurrent_count         = operation_preferences.value.max_concurrent_count
      max_concurrent_percentage    = operation_preferences.value.max_concurrent_percentage
      region_concurrency_type      = operation_preferences.value.region_concurrency_type
      region_order                 = operation_preferences.value.region_order
    }
  }
}
