resource "aws_codestarconnections_connection" "codestarconnections_connections" {
  for_each = var.codestarconnections_connections

  name          = each.value.name
  host_arn      = each.value.host_arn
  provider_type = each.value.provider_type
  region        = each.value.region
  tags          = each.value.tags
  tags_all      = each.value.tags_all
}
