resource "aws_db_proxy" "db_proxies" {
  for_each = var.db_proxies

  engine_family                  = each.value.engine_family
  name                           = each.value.name
  role_arn                       = each.value.role_arn
  vpc_subnet_ids                 = each.value.vpc_subnet_ids
  debug_logging                  = each.value.debug_logging
  default_auth_scheme            = each.value.default_auth_scheme
  endpoint_network_type          = each.value.endpoint_network_type
  idle_client_timeout            = each.value.idle_client_timeout
  region                         = each.value.region
  require_tls                    = each.value.require_tls
  tags                           = each.value.tags
  tags_all                       = each.value.tags_all
  target_connection_network_type = each.value.target_connection_network_type
  vpc_security_group_ids         = each.value.vpc_security_group_ids

  dynamic "auth" {
    for_each = each.value.auth != null ? each.value.auth : []
    content {
      auth_scheme               = auth.value.auth_scheme
      client_password_auth_type = auth.value.client_password_auth_type
      description               = auth.value.description
      iam_auth                  = auth.value.iam_auth
      secret_arn                = auth.value.secret_arn
      username                  = auth.value.username
    }
  }
}
