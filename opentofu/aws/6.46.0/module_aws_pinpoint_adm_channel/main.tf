resource "aws_pinpoint_adm_channel" "pinpoint_adm_channels" {
  for_each = var.pinpoint_adm_channels

  application_id = each.value.application_id
  client_id      = each.value.client_id
  client_secret  = each.value.client_secret
  enabled        = each.value.enabled
  region         = each.value.region
}
