resource "aws_ec2_allowed_images_settings" "ec2_allowed_images_settings" {
  for_each = var.ec2_allowed_images_settings

  state  = each.value.state
  region = each.value.region

  dynamic "image_criterion" {
    for_each = each.value.image_criterion != null ? each.value.image_criterion : []
    content {
      image_names               = image_criterion.value.image_names
      image_providers           = image_criterion.value.image_providers
      marketplace_product_codes = image_criterion.value.marketplace_product_codes

      dynamic "creation_date_condition" {
        for_each = image_criterion.value.creation_date_condition != null ? image_criterion.value.creation_date_condition : []
        content {
          maximum_days_since_created = creation_date_condition.value.maximum_days_since_created
        }
      }

      dynamic "deprecation_time_condition" {
        for_each = image_criterion.value.deprecation_time_condition != null ? image_criterion.value.deprecation_time_condition : []
        content {
          maximum_days_since_deprecated = deprecation_time_condition.value.maximum_days_since_deprecated
        }
      }
    }
  }
}
