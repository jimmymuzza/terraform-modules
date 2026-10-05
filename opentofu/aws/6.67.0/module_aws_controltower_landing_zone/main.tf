resource "aws_controltower_landing_zone" "controltower_landing_zones" {
  for_each = var.controltower_landing_zones

  manifest_json     = each.value.manifest_json
  version           = each.value.version
  region            = each.value.region
  remediation_types = each.value.remediation_types
  tags              = each.value.tags
  tags_all          = each.value.tags_all
}
