resource "aws_ssm_association" "ssm_associations" {
  for_each = var.ssm_associations

  name                             = each.value.name
  apply_only_at_cron_interval      = each.value.apply_only_at_cron_interval
  association_name                 = each.value.association_name
  automation_target_parameter_name = each.value.automation_target_parameter_name
  calendar_names                   = each.value.calendar_names
  compliance_severity              = each.value.compliance_severity
  document_version                 = each.value.document_version
  max_concurrency                  = each.value.max_concurrency
  max_errors                       = each.value.max_errors
  parameters                       = each.value.parameters
  region                           = each.value.region
  schedule_expression              = each.value.schedule_expression
  sync_compliance                  = each.value.sync_compliance
  tags                             = each.value.tags
  tags_all                         = each.value.tags_all
  wait_for_success_timeout_seconds = each.value.wait_for_success_timeout_seconds

  dynamic "output_location" {
    for_each = each.value.output_location != null ? each.value.output_location : []
    content {
      s3_bucket_name = output_location.value.s3_bucket_name
      s3_key_prefix  = output_location.value.s3_key_prefix
      s3_region      = output_location.value.s3_region
    }
  }

  dynamic "targets" {
    for_each = each.value.targets != null ? each.value.targets : []
    content {
      key    = targets.value.key
      values = targets.value.values
    }
  }
}
