resource "aws_guardduty_member_detector_feature" "guardduty_member_detector_features" {
  for_each = var.guardduty_member_detector_features

  account_id  = each.value.account_id
  detector_id = each.value.detector_id
  name        = each.value.name
  status      = each.value.status
  region      = each.value.region

  dynamic "additional_configuration" {
    for_each = each.value.additional_configuration != null ? each.value.additional_configuration : []
    content {
      name   = additional_configuration.value.name
      status = additional_configuration.value.status
    }
  }
}
