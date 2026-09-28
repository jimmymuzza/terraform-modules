resource "aws_sagemaker_model_package_group_policy" "sagemaker_model_package_group_policies" {
  for_each = var.sagemaker_model_package_group_policies

  model_package_group_name = each.value.model_package_group_name
  resource_policy          = each.value.resource_policy
  region                   = each.value.region
}
