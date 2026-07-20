resource "aws_sagemaker_studio_lifecycle_config" "sagemaker_studio_lifecycle_configs" {
  for_each = var.sagemaker_studio_lifecycle_configs

  studio_lifecycle_config_app_type = each.value.studio_lifecycle_config_app_type
  studio_lifecycle_config_content  = each.value.studio_lifecycle_config_content
  studio_lifecycle_config_name     = each.value.studio_lifecycle_config_name
  region                           = each.value.region
  tags                             = each.value.tags
  tags_all                         = each.value.tags_all
}
