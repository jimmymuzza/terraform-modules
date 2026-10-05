resource "aws_bedrock_custom_model" "bedrock_custom_models" {
  for_each = var.bedrock_custom_models

  base_model_identifier   = each.value.base_model_identifier
  custom_model_name       = each.value.custom_model_name
  hyperparameters         = each.value.hyperparameters
  job_name                = each.value.job_name
  role_arn                = each.value.role_arn
  custom_model_kms_key_id = each.value.custom_model_kms_key_id
  customization_type      = each.value.customization_type
  region                  = each.value.region
  tags                    = each.value.tags

  dynamic "output_data_config" {
    for_each = each.value.output_data_config != null ? each.value.output_data_config : []
    content {
      s3_uri = output_data_config.value.s3_uri
    }
  }

  dynamic "training_data_config" {
    for_each = each.value.training_data_config != null ? each.value.training_data_config : []
    content {
      s3_uri = training_data_config.value.s3_uri
    }
  }

  dynamic "validation_data_config" {
    for_each = each.value.validation_data_config != null ? each.value.validation_data_config : []
    content {

      dynamic "validator" {
        for_each = validation_data_config.value.validator != null ? validation_data_config.value.validator : []
        content {
          s3_uri = validator.value.s3_uri
        }
      }
    }
  }

  dynamic "vpc_config" {
    for_each = each.value.vpc_config != null ? each.value.vpc_config : []
    content {
      security_group_ids = vpc_config.value.security_group_ids
      subnet_ids         = vpc_config.value.subnet_ids
    }
  }
}
