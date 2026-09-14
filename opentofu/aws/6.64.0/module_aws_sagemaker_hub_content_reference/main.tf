resource "aws_sagemaker_hub_content_reference" "sagemaker_hub_content_references" {
  for_each = var.sagemaker_hub_content_references

  hub_content_name                 = each.value.hub_content_name
  hub_name                         = each.value.hub_name
  sagemaker_public_hub_content_arn = each.value.sagemaker_public_hub_content_arn
  min_version                      = each.value.min_version
  region                           = each.value.region
  tags                             = each.value.tags
}
