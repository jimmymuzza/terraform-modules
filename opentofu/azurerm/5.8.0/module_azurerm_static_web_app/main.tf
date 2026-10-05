resource "azurerm_static_web_app" "static_web_apps" {
  for_each = var.static_web_apps

  location                           = each.value.location
  name                               = each.value.name
  resource_group_name                = each.value.resource_group_name
  app_settings                       = each.value.app_settings
  configuration_file_changes_enabled = each.value.configuration_file_changes_enabled
  preview_environments_enabled       = each.value.preview_environments_enabled
  public_network_access_enabled      = each.value.public_network_access_enabled
  repository_branch                  = each.value.repository_branch
  repository_token                   = each.value.repository_token
  repository_url                     = each.value.repository_url
  sku_size                           = each.value.sku_size
  sku_tier                           = each.value.sku_tier
  tags                               = each.value.tags

  dynamic "basic_auth" {
    for_each = each.value.basic_auth != null ? each.value.basic_auth : []
    content {
      environments = basic_auth.value.environments
      password     = basic_auth.value.password
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }
}
