resource "aws_sagemaker_model_package_group" "sagemaker_model_package_groups" {
  for_each = var.sagemaker_model_package_groups

  model_package_group_name        = each.value.model_package_group_name
  model_package_group_description = each.value.model_package_group_description
  region                          = each.value.region
  tags                            = each.value.tags
  tags_all                        = each.value.tags_all
}
