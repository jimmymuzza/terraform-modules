resource "aws_pinpoint_sms_channel" "pinpoint_sms_channels" {
  for_each = var.pinpoint_sms_channels

  application_id = each.value.application_id
  enabled        = each.value.enabled
  region         = each.value.region
  sender_id      = each.value.sender_id
  short_code     = each.value.short_code
}
