resource "aws_chime_voice_connector_termination" "chime_voice_connector_terminations" {
  for_each = var.chime_voice_connector_terminations

  calling_regions      = each.value.calling_regions
  cidr_allow_list      = each.value.cidr_allow_list
  voice_connector_id   = each.value.voice_connector_id
  cps_limit            = each.value.cps_limit
  default_phone_number = each.value.default_phone_number
  disabled             = each.value.disabled
  region               = each.value.region
}
