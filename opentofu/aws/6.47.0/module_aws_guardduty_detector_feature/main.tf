resource "aws_guardduty_detector_feature" "guardduty_detector_features" {
  for_each = var.guardduty_detector_features

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
