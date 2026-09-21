resource "aws_dx_lag" "dx_lags" {
  for_each = var.dx_lags

  connections_bandwidth = each.value.connections_bandwidth
  location              = each.value.location
  name                  = each.value.name
  connection_id         = each.value.connection_id
  force_destroy         = each.value.force_destroy
  provider_name         = each.value.provider_name
  region                = each.value.region
  tags                  = each.value.tags
  tags_all              = each.value.tags_all
}
