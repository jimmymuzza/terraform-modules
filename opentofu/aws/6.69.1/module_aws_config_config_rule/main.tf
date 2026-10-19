resource "aws_config_config_rule" "config_config_rules" {
  for_each = var.config_config_rules

  name                        = each.value.name
  description                 = each.value.description
  input_parameters            = each.value.input_parameters
  maximum_execution_frequency = each.value.maximum_execution_frequency
  region                      = each.value.region
  tags                        = each.value.tags
  tags_all                    = each.value.tags_all

  dynamic "evaluation_mode" {
    for_each = each.value.evaluation_mode != null ? each.value.evaluation_mode : []
    content {
      mode = evaluation_mode.value.mode
    }
  }

  dynamic "scope" {
    for_each = each.value.scope != null ? each.value.scope : []
    content {
      compliance_resource_id    = scope.value.compliance_resource_id
      compliance_resource_types = scope.value.compliance_resource_types
      tag_key                   = scope.value.tag_key
      tag_value                 = scope.value.tag_value
    }
  }

  dynamic "source" {
    for_each = each.value.source != null ? each.value.source : []
    content {
      owner             = source.value.owner
      source_identifier = source.value.source_identifier

      dynamic "custom_policy_details" {
        for_each = source.value.custom_policy_details != null ? source.value.custom_policy_details : []
        content {
          policy_runtime            = custom_policy_details.value.policy_runtime
          policy_text               = custom_policy_details.value.policy_text
          enable_debug_log_delivery = custom_policy_details.value.enable_debug_log_delivery
        }
      }

      dynamic "source_detail" {
        for_each = source.value.source_detail != null ? source.value.source_detail : []
        content {
          event_source                = source_detail.value.event_source
          maximum_execution_frequency = source_detail.value.maximum_execution_frequency
          message_type                = source_detail.value.message_type
        }
      }
    }
  }
}
