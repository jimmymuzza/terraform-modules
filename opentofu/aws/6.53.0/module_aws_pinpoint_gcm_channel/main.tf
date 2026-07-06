resource "aws_pinpoint_gcm_channel" "pinpoint_gcm_channels" {
  for_each = var.pinpoint_gcm_channels

  application_id                = each.value.application_id
  api_key                       = each.value.api_key
  default_authentication_method = each.value.default_authentication_method
  enabled                       = each.value.enabled
  region                        = each.value.region
  service_json                  = each.value.service_json
}
