resource "aws_cur_report_definition" "cur_report_definitions" {
  for_each = var.cur_report_definitions

  additional_schema_elements = each.value.additional_schema_elements
  compression                = each.value.compression
  format                     = each.value.format
  report_name                = each.value.report_name
  s3_bucket                  = each.value.s3_bucket
  s3_prefix                  = each.value.s3_prefix
  s3_region                  = each.value.s3_region
  time_unit                  = each.value.time_unit
  additional_artifacts       = each.value.additional_artifacts
  refresh_closed_reports     = each.value.refresh_closed_reports
  report_versioning          = each.value.report_versioning
  tags                       = each.value.tags
  tags_all                   = each.value.tags_all
}
