resource "azurerm_spring_cloud_api_portal" "spring_cloud_api_portals" {
  for_each = var.spring_cloud_api_portals

  name                          = each.value.name
  spring_cloud_service_id       = each.value.spring_cloud_service_id
  api_try_out_enabled           = each.value.api_try_out_enabled
  gateway_ids                   = each.value.gateway_ids
  https_only_enabled            = each.value.https_only_enabled
  instance_count                = each.value.instance_count
  public_network_access_enabled = each.value.public_network_access_enabled

  dynamic "sso" {
    for_each = each.value.sso != null ? each.value.sso : []
    content {
      client_id     = sso.value.client_id
      client_secret = sso.value.client_secret
      issuer_uri    = sso.value.issuer_uri
      scope         = sso.value.scope
    }
  }
}
