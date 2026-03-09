resource "aws_sns_sms_preferences" "sns_sms_preferences" {
  for_each = var.sns_sms_preferences

  default_sender_id                     = each.value.default_sender_id
  default_sms_type                      = each.value.default_sms_type
  delivery_status_iam_role_arn          = each.value.delivery_status_iam_role_arn
  delivery_status_success_sampling_rate = each.value.delivery_status_success_sampling_rate
  monthly_spend_limit                   = each.value.monthly_spend_limit
  region                                = each.value.region
  usage_report_s3_bucket                = each.value.usage_report_s3_bucket
}
