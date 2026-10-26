resource "aws_sagemaker_notebook_instance_lifecycle_configuration" "sagemaker_notebook_instance_lifecycle_configurations" {
  for_each = var.sagemaker_notebook_instance_lifecycle_configurations

  name      = each.value.name
  on_create = each.value.on_create
  on_start  = each.value.on_start
  region    = each.value.region
  tags      = each.value.tags
  tags_all  = each.value.tags_all
}
