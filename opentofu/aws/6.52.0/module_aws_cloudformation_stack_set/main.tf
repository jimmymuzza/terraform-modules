resource "aws_cloudformation_stack_set" "cloudformation_stack_sets" {
  for_each = var.cloudformation_stack_sets

  name                    = each.value.name
  administration_role_arn = each.value.administration_role_arn
  call_as                 = each.value.call_as
  capabilities            = each.value.capabilities
  description             = each.value.description
  execution_role_name     = each.value.execution_role_name
  parameters              = each.value.parameters
  permission_model        = each.value.permission_model
  region                  = each.value.region
  tags                    = each.value.tags
  tags_all                = each.value.tags_all
  template_body           = each.value.template_body
  template_url            = each.value.template_url

  dynamic "auto_deployment" {
    for_each = each.value.auto_deployment != null ? each.value.auto_deployment : []
    content {
      depends_on_stack_sets            = auto_deployment.value.depends_on_stack_sets
      enabled                          = auto_deployment.value.enabled
      retain_stacks_on_account_removal = auto_deployment.value.retain_stacks_on_account_removal
    }
  }

  dynamic "managed_execution" {
    for_each = each.value.managed_execution != null ? each.value.managed_execution : []
    content {
      active = managed_execution.value.active
    }
  }

  dynamic "operation_preferences" {
    for_each = each.value.operation_preferences != null ? each.value.operation_preferences : []
    content {
      failure_tolerance_count      = operation_preferences.value.failure_tolerance_count
      failure_tolerance_percentage = operation_preferences.value.failure_tolerance_percentage
      max_concurrent_count         = operation_preferences.value.max_concurrent_count
      max_concurrent_percentage    = operation_preferences.value.max_concurrent_percentage
      region_concurrency_type      = operation_preferences.value.region_concurrency_type
      region_order                 = operation_preferences.value.region_order
    }
  }
}
