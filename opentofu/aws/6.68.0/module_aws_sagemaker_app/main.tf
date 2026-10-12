resource "aws_sagemaker_app" "sagemaker_apps" {
  for_each = var.sagemaker_apps

  app_name          = each.value.app_name
  app_type          = each.value.app_type
  domain_id         = each.value.domain_id
  region            = each.value.region
  space_name        = each.value.space_name
  tags              = each.value.tags
  tags_all          = each.value.tags_all
  user_profile_name = each.value.user_profile_name

  dynamic "resource_spec" {
    for_each = each.value.resource_spec != null ? each.value.resource_spec : []
    content {
      instance_type                 = resource_spec.value.instance_type
      lifecycle_config_arn          = resource_spec.value.lifecycle_config_arn
      sagemaker_image_arn           = resource_spec.value.sagemaker_image_arn
      sagemaker_image_version_alias = resource_spec.value.sagemaker_image_version_alias
      sagemaker_image_version_arn   = resource_spec.value.sagemaker_image_version_arn
    }
  }
}
