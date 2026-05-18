resource "aws_cognito_user_pool_ui_customization" "cognito_user_pool_ui_customizations" {
  for_each = var.cognito_user_pool_ui_customizations

  user_pool_id = each.value.user_pool_id
  client_id    = each.value.client_id
  css          = each.value.css
  image_file   = each.value.image_file
  region       = each.value.region
}
