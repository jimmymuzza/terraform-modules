resource "aws_synthetics_canary" "synthetics_canaries" {
  for_each = var.synthetics_canaries

  artifact_s3_location     = each.value.artifact_s3_location
  execution_role_arn       = each.value.execution_role_arn
  handler                  = each.value.handler
  name                     = each.value.name
  runtime_version          = each.value.runtime_version
  delete_lambda            = each.value.delete_lambda
  failure_retention_period = each.value.failure_retention_period
  region                   = each.value.region
  s3_bucket                = each.value.s3_bucket
  s3_key                   = each.value.s3_key
  s3_version               = each.value.s3_version
  start_canary             = each.value.start_canary
  success_retention_period = each.value.success_retention_period
  tags                     = each.value.tags
  tags_all                 = each.value.tags_all
  zip_file                 = each.value.zip_file

  dynamic "artifact_config" {
    for_each = each.value.artifact_config != null ? each.value.artifact_config : []
    content {

      dynamic "s3_encryption" {
        for_each = artifact_config.value.s3_encryption != null ? artifact_config.value.s3_encryption : []
        content {
          encryption_mode = s3_encryption.value.encryption_mode
          kms_key_arn     = s3_encryption.value.kms_key_arn
        }
      }
    }
  }

  dynamic "run_config" {
    for_each = each.value.run_config != null ? each.value.run_config : []
    content {
      active_tracing        = run_config.value.active_tracing
      environment_variables = run_config.value.environment_variables
      ephemeral_storage     = run_config.value.ephemeral_storage
      memory_in_mb          = run_config.value.memory_in_mb
      timeout_in_seconds    = run_config.value.timeout_in_seconds
    }
  }

  dynamic "schedule" {
    for_each = each.value.schedule != null ? each.value.schedule : []
    content {
      expression          = schedule.value.expression
      duration_in_seconds = schedule.value.duration_in_seconds

      dynamic "retry_config" {
        for_each = schedule.value.retry_config != null ? schedule.value.retry_config : []
        content {
          max_retries = retry_config.value.max_retries
        }
      }
    }
  }

  dynamic "vpc_config" {
    for_each = each.value.vpc_config != null ? each.value.vpc_config : []
    content {
      ipv6_allowed_for_dual_stack = vpc_config.value.ipv6_allowed_for_dual_stack
      security_group_ids          = vpc_config.value.security_group_ids
      subnet_ids                  = vpc_config.value.subnet_ids
    }
  }
}
