resource "aws_autoscalingplans_scaling_plan" "autoscalingplans_scaling_plans" {
  for_each = var.autoscalingplans_scaling_plans

  name   = each.value.name
  region = each.value.region

  dynamic "application_source" {
    for_each = each.value.application_source != null ? each.value.application_source : []
    content {
      cloudformation_stack_arn = application_source.value.cloudformation_stack_arn

      dynamic "tag_filter" {
        for_each = application_source.value.tag_filter != null ? application_source.value.tag_filter : []
        content {
          key    = tag_filter.value.key
          values = tag_filter.value.values
        }
      }
    }
  }

  dynamic "scaling_instruction" {
    for_each = each.value.scaling_instruction != null ? each.value.scaling_instruction : []
    content {
      max_capacity                             = scaling_instruction.value.max_capacity
      min_capacity                             = scaling_instruction.value.min_capacity
      resource_id                              = scaling_instruction.value.resource_id
      scalable_dimension                       = scaling_instruction.value.scalable_dimension
      service_namespace                        = scaling_instruction.value.service_namespace
      disable_dynamic_scaling                  = scaling_instruction.value.disable_dynamic_scaling
      predictive_scaling_max_capacity_behavior = scaling_instruction.value.predictive_scaling_max_capacity_behavior
      predictive_scaling_max_capacity_buffer   = scaling_instruction.value.predictive_scaling_max_capacity_buffer
      predictive_scaling_mode                  = scaling_instruction.value.predictive_scaling_mode
      scaling_policy_update_behavior           = scaling_instruction.value.scaling_policy_update_behavior
      scheduled_action_buffer_time             = scaling_instruction.value.scheduled_action_buffer_time

      dynamic "customized_load_metric_specification" {
        for_each = scaling_instruction.value.customized_load_metric_specification != null ? scaling_instruction.value.customized_load_metric_specification : []
        content {
          metric_name = customized_load_metric_specification.value.metric_name
          namespace   = customized_load_metric_specification.value.namespace
          statistic   = customized_load_metric_specification.value.statistic
          dimensions  = customized_load_metric_specification.value.dimensions
          unit        = customized_load_metric_specification.value.unit
        }
      }

      dynamic "predefined_load_metric_specification" {
        for_each = scaling_instruction.value.predefined_load_metric_specification != null ? scaling_instruction.value.predefined_load_metric_specification : []
        content {
          predefined_load_metric_type = predefined_load_metric_specification.value.predefined_load_metric_type
          resource_label              = predefined_load_metric_specification.value.resource_label
        }
      }

      dynamic "target_tracking_configuration" {
        for_each = scaling_instruction.value.target_tracking_configuration != null ? scaling_instruction.value.target_tracking_configuration : []
        content {
          target_value              = target_tracking_configuration.value.target_value
          disable_scale_in          = target_tracking_configuration.value.disable_scale_in
          estimated_instance_warmup = target_tracking_configuration.value.estimated_instance_warmup
          scale_in_cooldown         = target_tracking_configuration.value.scale_in_cooldown
          scale_out_cooldown        = target_tracking_configuration.value.scale_out_cooldown

          dynamic "customized_scaling_metric_specification" {
            for_each = target_tracking_configuration.value.customized_scaling_metric_specification != null ? target_tracking_configuration.value.customized_scaling_metric_specification : []
            content {
              metric_name = customized_scaling_metric_specification.value.metric_name
              namespace   = customized_scaling_metric_specification.value.namespace
              statistic   = customized_scaling_metric_specification.value.statistic
              dimensions  = customized_scaling_metric_specification.value.dimensions
              unit        = customized_scaling_metric_specification.value.unit
            }
          }

          dynamic "predefined_scaling_metric_specification" {
            for_each = target_tracking_configuration.value.predefined_scaling_metric_specification != null ? target_tracking_configuration.value.predefined_scaling_metric_specification : []
            content {
              predefined_scaling_metric_type = predefined_scaling_metric_specification.value.predefined_scaling_metric_type
              resource_label                 = predefined_scaling_metric_specification.value.resource_label
            }
          }
        }
      }
    }
  }
}
