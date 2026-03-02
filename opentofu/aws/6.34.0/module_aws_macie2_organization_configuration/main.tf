resource "aws_macie2_organization_configuration" "macie2_organization_configurations" {
  for_each = var.macie2_organization_configurations

  auto_enable = each.value.auto_enable
  region      = each.value.region
}
