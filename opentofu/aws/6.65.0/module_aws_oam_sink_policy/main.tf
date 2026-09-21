resource "aws_oam_sink_policy" "oam_sink_policies" {
  for_each = var.oam_sink_policies

  policy          = each.value.policy
  sink_identifier = each.value.sink_identifier
  region          = each.value.region
}
