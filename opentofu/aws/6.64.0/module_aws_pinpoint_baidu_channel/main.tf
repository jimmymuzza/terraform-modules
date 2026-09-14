resource "aws_pinpoint_baidu_channel" "pinpoint_baidu_channels" {
  for_each = var.pinpoint_baidu_channels

  api_key        = each.value.api_key
  application_id = each.value.application_id
  secret_key     = each.value.secret_key
  enabled        = each.value.enabled
  region         = each.value.region
}
