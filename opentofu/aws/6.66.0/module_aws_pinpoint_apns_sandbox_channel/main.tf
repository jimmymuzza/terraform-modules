resource "aws_pinpoint_apns_sandbox_channel" "pinpoint_apns_sandbox_channels" {
  for_each = var.pinpoint_apns_sandbox_channels

  application_id                = each.value.application_id
  bundle_id                     = each.value.bundle_id
  certificate                   = each.value.certificate
  default_authentication_method = each.value.default_authentication_method
  enabled                       = each.value.enabled
  private_key                   = each.value.private_key
  region                        = each.value.region
  team_id                       = each.value.team_id
  token_key                     = each.value.token_key
  token_key_id                  = each.value.token_key_id
}
