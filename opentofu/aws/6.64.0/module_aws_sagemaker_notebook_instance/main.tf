resource "aws_sagemaker_notebook_instance" "sagemaker_notebook_instances" {
  for_each = var.sagemaker_notebook_instances

  instance_type                = each.value.instance_type
  name                         = each.value.name
  role_arn                     = each.value.role_arn
  additional_code_repositories = each.value.additional_code_repositories
  default_code_repository      = each.value.default_code_repository
  direct_internet_access       = each.value.direct_internet_access
  kms_key_id                   = each.value.kms_key_id
  lifecycle_config_name        = each.value.lifecycle_config_name
  platform_identifier          = each.value.platform_identifier
  region                       = each.value.region
  root_access                  = each.value.root_access
  security_groups              = each.value.security_groups
  subnet_id                    = each.value.subnet_id
  tags                         = each.value.tags
  tags_all                     = each.value.tags_all
  volume_size                  = each.value.volume_size

  dynamic "instance_metadata_service_configuration" {
    for_each = each.value.instance_metadata_service_configuration != null ? each.value.instance_metadata_service_configuration : []
    content {
      minimum_instance_metadata_service_version = instance_metadata_service_configuration.value.minimum_instance_metadata_service_version
    }
  }
}
