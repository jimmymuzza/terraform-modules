resource "aws_config_remediation_configuration" "config_remediation_configurations" {
  for_each = var.config_remediation_configurations

  config_rule_name           = each.value.config_rule_name
  target_id                  = each.value.target_id
  target_type                = each.value.target_type
  automatic                  = each.value.automatic
  maximum_automatic_attempts = each.value.maximum_automatic_attempts
  region                     = each.value.region
  resource_type              = each.value.resource_type
  retry_attempt_seconds      = each.value.retry_attempt_seconds
  target_version             = each.value.target_version

  dynamic "execution_controls" {
    for_each = each.value.execution_controls != null ? each.value.execution_controls : []
    content {

      dynamic "ssm_controls" {
        for_each = execution_controls.value.ssm_controls != null ? execution_controls.value.ssm_controls : []
        content {
          concurrent_execution_rate_percentage = ssm_controls.value.concurrent_execution_rate_percentage
          error_percentage                     = ssm_controls.value.error_percentage
        }
      }
    }
  }

  dynamic "parameter" {
    for_each = each.value.parameter != null ? each.value.parameter : []
    content {
      name           = parameter.value.name
      resource_value = parameter.value.resource_value
      static_value   = parameter.value.static_value
      static_values  = parameter.value.static_values
    }
  }
}
