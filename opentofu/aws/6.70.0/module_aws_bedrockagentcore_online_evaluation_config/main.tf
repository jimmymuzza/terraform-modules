resource "aws_bedrockagentcore_online_evaluation_config" "bedrockagentcore_online_evaluation_configs" {
  for_each = var.bedrockagentcore_online_evaluation_configs

  enable_on_create              = each.value.enable_on_create
  evaluation_execution_role_arn = each.value.evaluation_execution_role_arn
  online_evaluation_config_name = each.value.online_evaluation_config_name
  description                   = each.value.description
  execution_status              = each.value.execution_status
  region                        = each.value.region
  tags                          = each.value.tags

  dynamic "data_source_config" {
    for_each = each.value.data_source_config != null ? each.value.data_source_config : []
    content {

      dynamic "cloudwatch_logs" {
        for_each = data_source_config.value.cloudwatch_logs != null ? data_source_config.value.cloudwatch_logs : []
        content {
          log_group_names = cloudwatch_logs.value.log_group_names
          service_names   = cloudwatch_logs.value.service_names
        }
      }
    }
  }

  dynamic "evaluator" {
    for_each = each.value.evaluator != null ? each.value.evaluator : []
    content {
      evaluator_id = evaluator.value.evaluator_id
    }
  }

  dynamic "rule" {
    for_each = each.value.rule != null ? each.value.rule : []
    content {

      dynamic "filter" {
        for_each = rule.value.filter != null ? rule.value.filter : []
        content {
          key      = filter.value.key
          operator = filter.value.operator

          dynamic "value" {
            for_each = filter.value.value != null ? filter.value.value : []
            content {
              boolean_value = value.value.boolean_value
              double_value  = value.value.double_value
              string_value  = value.value.string_value
            }
          }
        }
      }

      dynamic "sampling_config" {
        for_each = rule.value.sampling_config != null ? rule.value.sampling_config : []
        content {
          sampling_percentage = sampling_config.value.sampling_percentage
        }
      }

      dynamic "session_config" {
        for_each = rule.value.session_config != null ? rule.value.session_config : []
        content {
          session_timeout_minutes = session_config.value.session_timeout_minutes
        }
      }
    }
  }
}
