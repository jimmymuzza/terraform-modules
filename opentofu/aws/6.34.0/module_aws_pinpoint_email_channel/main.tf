resource "aws_pinpoint_email_channel" "pinpoint_email_channels" {
  for_each = var.pinpoint_email_channels

  application_id                 = each.value.application_id
  from_address                   = each.value.from_address
  identity                       = each.value.identity
  configuration_set              = each.value.configuration_set
  enabled                        = each.value.enabled
  orchestration_sending_role_arn = each.value.orchestration_sending_role_arn
  region                         = each.value.region
  role_arn                       = each.value.role_arn
}
