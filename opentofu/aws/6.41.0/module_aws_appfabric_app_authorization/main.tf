resource "aws_appfabric_app_authorization" "appfabric_app_authorizations" {
  for_each = var.appfabric_app_authorizations

  app            = each.value.app
  app_bundle_arn = each.value.app_bundle_arn
  auth_type      = each.value.auth_type
  region         = each.value.region
  tags           = each.value.tags

  dynamic "credential" {
    for_each = each.value.credential != null ? each.value.credential : []
    content {

      dynamic "api_key_credential" {
        for_each = credential.value.api_key_credential != null ? credential.value.api_key_credential : []
        content {
          api_key = api_key_credential.value.api_key
        }
      }

      dynamic "oauth2_credential" {
        for_each = credential.value.oauth2_credential != null ? credential.value.oauth2_credential : []
        content {
          client_id     = oauth2_credential.value.client_id
          client_secret = oauth2_credential.value.client_secret
        }
      }
    }
  }

  dynamic "tenant" {
    for_each = each.value.tenant != null ? each.value.tenant : []
    content {
      tenant_display_name = tenant.value.tenant_display_name
      tenant_identifier   = tenant.value.tenant_identifier
    }
  }
}
