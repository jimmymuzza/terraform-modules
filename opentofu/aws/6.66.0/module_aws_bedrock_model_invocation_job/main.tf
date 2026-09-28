resource "aws_bedrock_model_invocation_job" "bedrock_model_invocation_jobs" {
  for_each = var.bedrock_model_invocation_jobs

  job_name                  = each.value.job_name
  model_id                  = each.value.model_id
  role_arn                  = each.value.role_arn
  region                    = each.value.region
  skip_destroy              = each.value.skip_destroy
  timeout_duration_in_hours = each.value.timeout_duration_in_hours

  dynamic "input_data_config" {
    for_each = each.value.input_data_config != null ? each.value.input_data_config : []
    content {

      dynamic "s3_input_data_config" {
        for_each = input_data_config.value.s3_input_data_config != null ? input_data_config.value.s3_input_data_config : []
        content {
          s3_uri          = s3_input_data_config.value.s3_uri
          s3_bucket_owner = s3_input_data_config.value.s3_bucket_owner
          s3_input_format = s3_input_data_config.value.s3_input_format
        }
      }
    }
  }

  dynamic "output_data_config" {
    for_each = each.value.output_data_config != null ? each.value.output_data_config : []
    content {

      dynamic "s3_output_data_config" {
        for_each = output_data_config.value.s3_output_data_config != null ? output_data_config.value.s3_output_data_config : []
        content {
          s3_uri               = s3_output_data_config.value.s3_uri
          s3_bucket_owner      = s3_output_data_config.value.s3_bucket_owner
          s3_encryption_key_id = s3_output_data_config.value.s3_encryption_key_id
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
