resource "aws_licensemanager_association" "licensemanager_associations" {
  for_each = var.licensemanager_associations

  license_configuration_arn = each.value.license_configuration_arn
  resource_arn              = each.value.resource_arn
  region                    = each.value.region
}
