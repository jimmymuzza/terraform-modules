resource "aws_apprunner_connection" "apprunner_connections" {
  for_each = var.apprunner_connections

  connection_name = each.value.connection_name
  provider_type   = each.value.provider_type
  region          = each.value.region
  tags            = each.value.tags
  tags_all        = each.value.tags_all
}
