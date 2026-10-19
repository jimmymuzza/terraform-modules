resource "aws_appfabric_app_authorization_connection" "appfabric_app_authorization_connections" {
  for_each = var.appfabric_app_authorization_connections

  app_authorization_arn = each.value.app_authorization_arn
  app_bundle_arn        = each.value.app_bundle_arn
  region                = each.value.region

  dynamic "auth_request" {
    for_each = each.value.auth_request != null ? each.value.auth_request : []
    content {
      code         = auth_request.value.code
      redirect_uri = auth_request.value.redirect_uri
    }
  }
}
