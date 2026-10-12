resource "aws_ssm_service_setting" "ssm_service_settings" {
  for_each = var.ssm_service_settings

  setting_id    = each.value.setting_id
  setting_value = each.value.setting_value
  region        = each.value.region
}
