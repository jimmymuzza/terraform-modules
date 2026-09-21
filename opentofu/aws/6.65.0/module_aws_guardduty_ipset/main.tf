resource "aws_guardduty_ipset" "guardduty_ipsets" {
  for_each = var.guardduty_ipsets

  activate    = each.value.activate
  detector_id = each.value.detector_id
  format      = each.value.format
  location    = each.value.location
  name        = each.value.name
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all
}
