resource "aws_backup_report_plan" "backup_report_plans" {
  for_each = var.backup_report_plans

  name        = each.value.name
  description = each.value.description
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all

  dynamic "report_delivery_channel" {
    for_each = each.value.report_delivery_channel != null ? each.value.report_delivery_channel : []
    content {
      s3_bucket_name = report_delivery_channel.value.s3_bucket_name
      formats        = report_delivery_channel.value.formats
      s3_key_prefix  = report_delivery_channel.value.s3_key_prefix
    }
  }

  dynamic "report_setting" {
    for_each = each.value.report_setting != null ? each.value.report_setting : []
    content {
      report_template      = report_setting.value.report_template
      accounts             = report_setting.value.accounts
      framework_arns       = report_setting.value.framework_arns
      number_of_frameworks = report_setting.value.number_of_frameworks
      organization_units   = report_setting.value.organization_units
      regions              = report_setting.value.regions
    }
  }
}
