resource "aws_cloudformation_type" "cloudformation_types" {
  for_each = var.cloudformation_types

  schema_handler_package = each.value.schema_handler_package
  type_name              = each.value.type_name
  execution_role_arn     = each.value.execution_role_arn
  region                 = each.value.region
  type                   = each.value.type

  dynamic "logging_config" {
    for_each = each.value.logging_config != null ? each.value.logging_config : []
    content {
      log_group_name = logging_config.value.log_group_name
      log_role_arn   = logging_config.value.log_role_arn
    }
  }
}
