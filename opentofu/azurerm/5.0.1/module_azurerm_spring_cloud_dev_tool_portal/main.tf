resource "azurerm_spring_cloud_dev_tool_portal" "spring_cloud_dev_tool_portals" {
  for_each = var.spring_cloud_dev_tool_portals

  name                            = each.value.name
  spring_cloud_service_id         = each.value.spring_cloud_service_id
  application_accelerator_enabled = each.value.application_accelerator_enabled
  application_live_view_enabled   = each.value.application_live_view_enabled
  public_network_access_enabled   = each.value.public_network_access_enabled

  dynamic "sso" {
    for_each = each.value.sso != null ? each.value.sso : []
    content {
      client_id     = sso.value.client_id
      client_secret = sso.value.client_secret
      metadata_url  = sso.value.metadata_url
      scope         = sso.value.scope
    }
  }
}
