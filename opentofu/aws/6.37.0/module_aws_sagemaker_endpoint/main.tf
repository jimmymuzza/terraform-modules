resource "aws_sagemaker_endpoint" "sagemaker_endpoints" {
  for_each = var.sagemaker_endpoints

  endpoint_config_name = each.value.endpoint_config_name
  name                 = each.value.name
  region               = each.value.region
  tags                 = each.value.tags
  tags_all             = each.value.tags_all

  dynamic "deployment_config" {
    for_each = each.value.deployment_config != null ? each.value.deployment_config : []
    content {

      dynamic "auto_rollback_configuration" {
        for_each = deployment_config.value.auto_rollback_configuration != null ? deployment_config.value.auto_rollback_configuration : []
        content {

          dynamic "alarms" {
            for_each = auto_rollback_configuration.value.alarms != null ? auto_rollback_configuration.value.alarms : []
            content {
              alarm_name = alarms.value.alarm_name
            }
          }
        }
      }

      dynamic "blue_green_update_policy" {
        for_each = deployment_config.value.blue_green_update_policy != null ? deployment_config.value.blue_green_update_policy : []
        content {
          maximum_execution_timeout_in_seconds = blue_green_update_policy.value.maximum_execution_timeout_in_seconds
          termination_wait_in_seconds          = blue_green_update_policy.value.termination_wait_in_seconds

          dynamic "traffic_routing_configuration" {
            for_each = blue_green_update_policy.value.traffic_routing_configuration != null ? blue_green_update_policy.value.traffic_routing_configuration : []
            content {
              type                     = traffic_routing_configuration.value.type
              wait_interval_in_seconds = traffic_routing_configuration.value.wait_interval_in_seconds

              dynamic "canary_size" {
                for_each = traffic_routing_configuration.value.canary_size != null ? traffic_routing_configuration.value.canary_size : []
                content {
                  type  = canary_size.value.type
                  value = canary_size.value.value
                }
              }

              dynamic "linear_step_size" {
                for_each = traffic_routing_configuration.value.linear_step_size != null ? traffic_routing_configuration.value.linear_step_size : []
                content {
                  type  = linear_step_size.value.type
                  value = linear_step_size.value.value
                }
              }
            }
          }
        }
      }

      dynamic "rolling_update_policy" {
        for_each = deployment_config.value.rolling_update_policy != null ? deployment_config.value.rolling_update_policy : []
        content {
          wait_interval_in_seconds             = rolling_update_policy.value.wait_interval_in_seconds
          maximum_execution_timeout_in_seconds = rolling_update_policy.value.maximum_execution_timeout_in_seconds

          dynamic "maximum_batch_size" {
            for_each = rolling_update_policy.value.maximum_batch_size != null ? rolling_update_policy.value.maximum_batch_size : []
            content {
              type  = maximum_batch_size.value.type
              value = maximum_batch_size.value.value
            }
          }

          dynamic "rollback_maximum_batch_size" {
            for_each = rolling_update_policy.value.rollback_maximum_batch_size != null ? rolling_update_policy.value.rollback_maximum_batch_size : []
            content {
              type  = rollback_maximum_batch_size.value.type
              value = rollback_maximum_batch_size.value.value
            }
          }
        }
      }
    }
  }
}
