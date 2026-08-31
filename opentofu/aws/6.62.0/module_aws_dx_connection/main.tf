resource "aws_dx_connection" "dx_connections" {
  for_each = var.dx_connections

  bandwidth       = each.value.bandwidth
  location        = each.value.location
  name            = each.value.name
  encryption_mode = each.value.encryption_mode
  provider_name   = each.value.provider_name
  region          = each.value.region
  request_macsec  = each.value.request_macsec
  skip_destroy    = each.value.skip_destroy
  tags            = each.value.tags
  tags_all        = each.value.tags_all
}
