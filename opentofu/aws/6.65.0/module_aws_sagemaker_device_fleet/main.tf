resource "aws_sagemaker_device_fleet" "sagemaker_device_fleets" {
  for_each = var.sagemaker_device_fleets

  device_fleet_name     = each.value.device_fleet_name
  role_arn              = each.value.role_arn
  description           = each.value.description
  enable_iot_role_alias = each.value.enable_iot_role_alias
  region                = each.value.region
  tags                  = each.value.tags
  tags_all              = each.value.tags_all

  dynamic "output_config" {
    for_each = each.value.output_config != null ? each.value.output_config : []
    content {
      s3_output_location = output_config.value.s3_output_location
      kms_key_id         = output_config.value.kms_key_id
    }
  }
}
