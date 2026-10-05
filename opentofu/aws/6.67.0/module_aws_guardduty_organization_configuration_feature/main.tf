resource "aws_guardduty_organization_configuration_feature" "guardduty_organization_configuration_features" {
  for_each = var.guardduty_organization_configuration_features

  auto_enable = each.value.auto_enable
  detector_id = each.value.detector_id
  name        = each.value.name
  region      = each.value.region

  dynamic "additional_configuration" {
    for_each = each.value.additional_configuration != null ? each.value.additional_configuration : []
    content {
      auto_enable = additional_configuration.value.auto_enable
      name        = additional_configuration.value.name
    }
  }
}
