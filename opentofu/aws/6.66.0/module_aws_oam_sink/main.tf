resource "aws_oam_sink" "oam_sinks" {
  for_each = var.oam_sinks

  name     = each.value.name
  region   = each.value.region
  tags     = each.value.tags
  tags_all = each.value.tags_all
}
