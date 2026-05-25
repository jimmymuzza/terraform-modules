resource "azurerm_api_management_api" "api_management_apis" {
  for_each = var.api_management_apis

  api_management_name   = each.value.api_management_name
  name                  = each.value.name
  resource_group_name   = each.value.resource_group_name
  revision              = each.value.revision
  api_type              = each.value.api_type
  description           = each.value.description
  display_name          = each.value.display_name
  path                  = each.value.path
  protocols             = each.value.protocols
  revision_description  = each.value.revision_description
  service_url           = each.value.service_url
  source_api_id         = each.value.source_api_id
  subscription_required = each.value.subscription_required
  terms_of_service_url  = each.value.terms_of_service_url
  version               = each.value.version
  version_description   = each.value.version_description
  version_set_id        = each.value.version_set_id

  dynamic "contact" {
    for_each = each.value.contact != null ? each.value.contact : []
    content {
      email = contact.value.email
      name  = contact.value.name
      url   = contact.value.url
    }
  }

  dynamic "import" {
    for_each = each.value.import != null ? each.value.import : []
    content {
      content_format = import.value.content_format
      content_value  = import.value.content_value

      dynamic "wsdl_selector" {
        for_each = import.value.wsdl_selector != null ? import.value.wsdl_selector : []
        content {
          endpoint_name = wsdl_selector.value.endpoint_name
          service_name  = wsdl_selector.value.service_name
        }
      }
    }
  }

  dynamic "license" {
    for_each = each.value.license != null ? each.value.license : []
    content {
      name = license.value.name
      url  = license.value.url
    }
  }

  dynamic "oauth2_authorization" {
    for_each = each.value.oauth2_authorization != null ? each.value.oauth2_authorization : []
    content {
      authorization_server_name = oauth2_authorization.value.authorization_server_name
      scope                     = oauth2_authorization.value.scope
    }
  }

  dynamic "openid_authentication" {
    for_each = each.value.openid_authentication != null ? each.value.openid_authentication : []
    content {
      openid_provider_name         = openid_authentication.value.openid_provider_name
      bearer_token_sending_methods = openid_authentication.value.bearer_token_sending_methods
    }
  }

  dynamic "subscription_key_parameter_names" {
    for_each = each.value.subscription_key_parameter_names != null ? each.value.subscription_key_parameter_names : []
    content {
      header = subscription_key_parameter_names.value.header
      query  = subscription_key_parameter_names.value.query
    }
  }
}
