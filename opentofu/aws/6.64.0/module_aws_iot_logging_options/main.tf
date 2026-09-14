resource "aws_iot_logging_options" "iot_logging_options" {
  for_each = var.iot_logging_options

  default_log_level = each.value.default_log_level
  role_arn          = each.value.role_arn
  disable_all_logs  = each.value.disable_all_logs
  region            = each.value.region
}
