resource "aws_securityhub_organization_configuration" "securityhub_organization_configurations" {
  for_each = var.securityhub_organization_configurations

  auto_enable           = each.value.auto_enable
  auto_enable_standards = each.value.auto_enable_standards
  region                = each.value.region

  dynamic "organization_configuration" {
    for_each = each.value.organization_configuration != null ? each.value.organization_configuration : []
    content {
      configuration_type = organization_configuration.value.configuration_type
    }
  }
}
