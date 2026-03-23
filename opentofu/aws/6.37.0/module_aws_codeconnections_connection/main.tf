resource "aws_codeconnections_connection" "codeconnections_connections" {
  for_each = var.codeconnections_connections

  name          = each.value.name
  host_arn      = each.value.host_arn
  provider_type = each.value.provider_type
  region        = each.value.region
  tags          = each.value.tags
}
