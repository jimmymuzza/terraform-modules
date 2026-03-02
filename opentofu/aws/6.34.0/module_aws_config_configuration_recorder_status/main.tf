resource "aws_config_configuration_recorder_status" "config_configuration_recorder_status" {
  for_each = var.config_configuration_recorder_status

  is_enabled = each.value.is_enabled
  name       = each.value.name
  region     = each.value.region
}
