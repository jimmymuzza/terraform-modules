resource "aws_lambdamicrovms_microvm" "lambdamicrovms_microvms" {
  for_each = var.lambdamicrovms_microvms

  image_arn                   = each.value.image_arn
  egress_network_connectors   = each.value.egress_network_connectors
  execution_role_arn          = each.value.execution_role_arn
  image_version               = each.value.image_version
  ingress_network_connectors  = each.value.ingress_network_connectors
  maximum_duration_in_seconds = each.value.maximum_duration_in_seconds
  region                      = each.value.region
  run_hook_payload            = each.value.run_hook_payload

  dynamic "idle_policy" {
    for_each = each.value.idle_policy != null ? each.value.idle_policy : []
    content {
      auto_resume_enabled        = idle_policy.value.auto_resume_enabled
      max_idle_duration_seconds  = idle_policy.value.max_idle_duration_seconds
      suspended_duration_seconds = idle_policy.value.suspended_duration_seconds
    }
  }

  dynamic "logging" {
    for_each = each.value.logging != null ? each.value.logging : []
    content {

      dynamic "cloudwatch" {
        for_each = logging.value.cloudwatch != null ? logging.value.cloudwatch : []
        content {
          log_group  = cloudwatch.value.log_group
          log_stream = cloudwatch.value.log_stream
        }
      }

      dynamic "disabled" {
        for_each = logging.value.disabled != null ? logging.value.disabled : []
        content {
        }
      }
    }
  }
}
