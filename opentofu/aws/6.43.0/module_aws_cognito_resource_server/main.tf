resource "aws_cognito_resource_server" "cognito_resource_servers" {
  for_each = var.cognito_resource_servers

  identifier   = each.value.identifier
  name         = each.value.name
  user_pool_id = each.value.user_pool_id
  region       = each.value.region

  dynamic "scope" {
    for_each = each.value.scope != null ? each.value.scope : []
    content {
      scope_description = scope.value.scope_description
      scope_name        = scope.value.scope_name
    }
  }
}
