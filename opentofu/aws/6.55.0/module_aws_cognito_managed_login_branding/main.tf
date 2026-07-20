resource "aws_cognito_managed_login_branding" "cognito_managed_login_brandings" {
  for_each = var.cognito_managed_login_brandings

  client_id                   = each.value.client_id
  user_pool_id                = each.value.user_pool_id
  region                      = each.value.region
  settings                    = each.value.settings
  use_cognito_provided_values = each.value.use_cognito_provided_values

  dynamic "asset" {
    for_each = each.value.asset != null ? each.value.asset : []
    content {
      category    = asset.value.category
      color_mode  = asset.value.color_mode
      extension   = asset.value.extension
      bytes       = asset.value.bytes
      resource_id = asset.value.resource_id
    }
  }
}
