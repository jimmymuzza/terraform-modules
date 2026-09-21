resource "azurerm_datadog_monitor" "datadog_monitors" {
  for_each = var.datadog_monitors

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  sku_name            = each.value.sku_name
  monitoring_enabled  = each.value.monitoring_enabled
  tags                = each.value.tags

  dynamic "datadog_organization" {
    for_each = each.value.datadog_organization != null ? each.value.datadog_organization : []
    content {
      api_key           = datadog_organization.value.api_key
      application_key   = datadog_organization.value.application_key
      enterprise_app_id = datadog_organization.value.enterprise_app_id
      linking_auth_code = datadog_organization.value.linking_auth_code
      linking_client_id = datadog_organization.value.linking_client_id
      redirect_uri      = datadog_organization.value.redirect_uri
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type = identity.value.type
    }
  }

  dynamic "user" {
    for_each = each.value.user != null ? each.value.user : []
    content {
      email        = user.value.email
      name         = user.value.name
      phone_number = user.value.phone_number
    }
  }
}
