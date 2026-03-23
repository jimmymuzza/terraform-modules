resource "aws_sfn_state_machine" "sfn_state_machines" {
  for_each = var.sfn_state_machines

  definition  = each.value.definition
  role_arn    = each.value.role_arn
  name        = each.value.name
  name_prefix = each.value.name_prefix
  publish     = each.value.publish
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all
  type        = each.value.type

  dynamic "encryption_configuration" {
    for_each = each.value.encryption_configuration != null ? each.value.encryption_configuration : []
    content {
      kms_data_key_reuse_period_seconds = encryption_configuration.value.kms_data_key_reuse_period_seconds
      kms_key_id                        = encryption_configuration.value.kms_key_id
      type                              = encryption_configuration.value.type
    }
  }

  dynamic "logging_configuration" {
    for_each = each.value.logging_configuration != null ? each.value.logging_configuration : []
    content {
      include_execution_data = logging_configuration.value.include_execution_data
      level                  = logging_configuration.value.level
      log_destination        = logging_configuration.value.log_destination
    }
  }

  dynamic "tracing_configuration" {
    for_each = each.value.tracing_configuration != null ? each.value.tracing_configuration : []
    content {
      enabled = tracing_configuration.value.enabled
    }
  }
}
