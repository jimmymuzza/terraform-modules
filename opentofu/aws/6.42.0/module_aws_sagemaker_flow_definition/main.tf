resource "aws_sagemaker_flow_definition" "sagemaker_flow_definitions" {
  for_each = var.sagemaker_flow_definitions

  flow_definition_name = each.value.flow_definition_name
  role_arn             = each.value.role_arn
  region               = each.value.region
  tags                 = each.value.tags
  tags_all             = each.value.tags_all

  dynamic "human_loop_activation_config" {
    for_each = each.value.human_loop_activation_config != null ? each.value.human_loop_activation_config : []
    content {

      dynamic "human_loop_activation_conditions_config" {
        for_each = human_loop_activation_config.value.human_loop_activation_conditions_config != null ? human_loop_activation_config.value.human_loop_activation_conditions_config : []
        content {
          human_loop_activation_conditions = human_loop_activation_conditions_config.value.human_loop_activation_conditions
        }
      }
    }
  }

  dynamic "human_loop_config" {
    for_each = each.value.human_loop_config != null ? each.value.human_loop_config : []
    content {
      human_task_ui_arn                     = human_loop_config.value.human_task_ui_arn
      task_count                            = human_loop_config.value.task_count
      task_description                      = human_loop_config.value.task_description
      task_title                            = human_loop_config.value.task_title
      workteam_arn                          = human_loop_config.value.workteam_arn
      task_availability_lifetime_in_seconds = human_loop_config.value.task_availability_lifetime_in_seconds
      task_keywords                         = human_loop_config.value.task_keywords
      task_time_limit_in_seconds            = human_loop_config.value.task_time_limit_in_seconds

      dynamic "public_workforce_task_price" {
        for_each = human_loop_config.value.public_workforce_task_price != null ? human_loop_config.value.public_workforce_task_price : []
        content {

          dynamic "amount_in_usd" {
            for_each = public_workforce_task_price.value.amount_in_usd != null ? public_workforce_task_price.value.amount_in_usd : []
            content {
              cents                     = amount_in_usd.value.cents
              dollars                   = amount_in_usd.value.dollars
              tenth_fractions_of_a_cent = amount_in_usd.value.tenth_fractions_of_a_cent
            }
          }
        }
      }
    }
  }

  dynamic "human_loop_request_source" {
    for_each = each.value.human_loop_request_source != null ? each.value.human_loop_request_source : []
    content {
      aws_managed_human_loop_request_source = human_loop_request_source.value.aws_managed_human_loop_request_source
    }
  }

  dynamic "output_config" {
    for_each = each.value.output_config != null ? each.value.output_config : []
    content {
      s3_output_path = output_config.value.s3_output_path
      kms_key_id     = output_config.value.kms_key_id
    }
  }
}
