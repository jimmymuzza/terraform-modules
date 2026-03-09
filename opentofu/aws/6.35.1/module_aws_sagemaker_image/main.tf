resource "aws_sagemaker_image" "sagemaker_images" {
  for_each = var.sagemaker_images

  image_name   = each.value.image_name
  role_arn     = each.value.role_arn
  description  = each.value.description
  display_name = each.value.display_name
  region       = each.value.region
  tags         = each.value.tags
  tags_all     = each.value.tags_all
}
