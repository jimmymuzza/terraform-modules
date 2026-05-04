resource "azurerm_spring_cloud_gateway_route_config" "spring_cloud_gateway_route_configs" {
  for_each = var.spring_cloud_gateway_route_configs

  name                    = each.value.name
  protocol                = each.value.protocol
  spring_cloud_gateway_id = each.value.spring_cloud_gateway_id
  filters                 = each.value.filters
  predicates              = each.value.predicates
  spring_cloud_app_id     = each.value.spring_cloud_app_id
  sso_validation_enabled  = each.value.sso_validation_enabled

  dynamic "open_api" {
    for_each = each.value.open_api != null ? each.value.open_api : []
    content {
      uri = open_api.value.uri
    }
  }

  dynamic "route" {
    for_each = each.value.route != null ? each.value.route : []
    content {
      order                  = route.value.order
      classification_tags    = route.value.classification_tags
      description            = route.value.description
      filters                = route.value.filters
      predicates             = route.value.predicates
      sso_validation_enabled = route.value.sso_validation_enabled
      title                  = route.value.title
      token_relay            = route.value.token_relay
      uri                    = route.value.uri
    }
  }
}
