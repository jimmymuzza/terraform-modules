resource "aws_osis_pipeline" "osis_pipelines" {
  for_each = var.osis_pipelines

  max_units                   = each.value.max_units
  min_units                   = each.value.min_units
  pipeline_configuration_body = each.value.pipeline_configuration_body
  pipeline_name               = each.value.pipeline_name
  pipeline_role_arn           = each.value.pipeline_role_arn
  region                      = each.value.region
  tags                        = each.value.tags

  dynamic "buffer_options" {
    for_each = each.value.buffer_options != null ? each.value.buffer_options : []
    content {
      persistent_buffer_enabled = buffer_options.value.persistent_buffer_enabled
    }
  }

  dynamic "encryption_at_rest_options" {
    for_each = each.value.encryption_at_rest_options != null ? each.value.encryption_at_rest_options : []
    content {
      kms_key_arn = encryption_at_rest_options.value.kms_key_arn
    }
  }

  dynamic "log_publishing_options" {
    for_each = each.value.log_publishing_options != null ? each.value.log_publishing_options : []
    content {
      is_logging_enabled = log_publishing_options.value.is_logging_enabled

      dynamic "cloudwatch_log_destination" {
        for_each = log_publishing_options.value.cloudwatch_log_destination != null ? log_publishing_options.value.cloudwatch_log_destination : []
        content {
          log_group = cloudwatch_log_destination.value.log_group
        }
      }
    }
  }

  dynamic "vpc_options" {
    for_each = each.value.vpc_options != null ? each.value.vpc_options : []
    content {
      subnet_ids              = vpc_options.value.subnet_ids
      security_group_ids      = vpc_options.value.security_group_ids
      vpc_endpoint_management = vpc_options.value.vpc_endpoint_management
    }
  }
}
