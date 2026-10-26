resource "aws_sagemaker_labeling_job" "sagemaker_labeling_jobs" {
  for_each = var.sagemaker_labeling_jobs

  label_attribute_name         = each.value.label_attribute_name
  labeling_job_name            = each.value.labeling_job_name
  role_arn                     = each.value.role_arn
  label_category_config_s3_uri = each.value.label_category_config_s3_uri
  region                       = each.value.region
  stopping_conditions          = each.value.stopping_conditions
  tags                         = each.value.tags

  dynamic "human_task_config" {
    for_each = each.value.human_task_config != null ? each.value.human_task_config : []
    content {
      number_of_human_workers_per_data_object = human_task_config.value.number_of_human_workers_per_data_object
      task_description                        = human_task_config.value.task_description
      task_time_limit_in_seconds              = human_task_config.value.task_time_limit_in_seconds
      task_title                              = human_task_config.value.task_title
      workteam_arn                            = human_task_config.value.workteam_arn
      max_concurrent_task_count               = human_task_config.value.max_concurrent_task_count
      pre_human_task_lambda_arn               = human_task_config.value.pre_human_task_lambda_arn
      task_availability_lifetime_in_seconds   = human_task_config.value.task_availability_lifetime_in_seconds
      task_keywords                           = human_task_config.value.task_keywords

      dynamic "annotation_consolidation_config" {
        for_each = human_task_config.value.annotation_consolidation_config != null ? human_task_config.value.annotation_consolidation_config : []
        content {
          annotation_consolidation_lambda_arn = annotation_consolidation_config.value.annotation_consolidation_lambda_arn
        }
      }

      dynamic "public_workforce_task_price" {
        for_each = human_task_config.value.public_workforce_task_price != null ? human_task_config.value.public_workforce_task_price : []
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

      dynamic "ui_config" {
        for_each = human_task_config.value.ui_config != null ? human_task_config.value.ui_config : []
        content {
          human_task_ui_arn  = ui_config.value.human_task_ui_arn
          ui_template_s3_uri = ui_config.value.ui_template_s3_uri
        }
      }
    }
  }

  dynamic "input_config" {
    for_each = each.value.input_config != null ? each.value.input_config : []
    content {

      dynamic "data_attributes" {
        for_each = input_config.value.data_attributes != null ? input_config.value.data_attributes : []
        content {
          content_classifiers = data_attributes.value.content_classifiers
        }
      }

      dynamic "data_source" {
        for_each = input_config.value.data_source != null ? input_config.value.data_source : []
        content {

          dynamic "s3_data_source" {
            for_each = data_source.value.s3_data_source != null ? data_source.value.s3_data_source : []
            content {
              manifest_s3_uri = s3_data_source.value.manifest_s3_uri
            }
          }

          dynamic "sns_data_source" {
            for_each = data_source.value.sns_data_source != null ? data_source.value.sns_data_source : []
            content {
              sns_topic_arn = sns_data_source.value.sns_topic_arn
            }
          }
        }
      }
    }
  }

  dynamic "labeling_job_algorithms_config" {
    for_each = each.value.labeling_job_algorithms_config != null ? each.value.labeling_job_algorithms_config : []
    content {
      labeling_job_algorithm_specification_arn = labeling_job_algorithms_config.value.labeling_job_algorithm_specification_arn
      initial_active_learning_model_arn        = labeling_job_algorithms_config.value.initial_active_learning_model_arn

      dynamic "labeling_job_resource_config" {
        for_each = labeling_job_algorithms_config.value.labeling_job_resource_config != null ? labeling_job_algorithms_config.value.labeling_job_resource_config : []
        content {
          volume_kms_key_id = labeling_job_resource_config.value.volume_kms_key_id

          dynamic "vpc_config" {
            for_each = labeling_job_resource_config.value.vpc_config != null ? labeling_job_resource_config.value.vpc_config : []
            content {
              security_group_ids = vpc_config.value.security_group_ids
              subnets            = vpc_config.value.subnets
            }
          }
        }
      }
    }
  }

  dynamic "output_config" {
    for_each = each.value.output_config != null ? each.value.output_config : []
    content {
      s3_output_path = output_config.value.s3_output_path
      kms_key_id     = output_config.value.kms_key_id
      sns_topic_arn  = output_config.value.sns_topic_arn
    }
  }
}
