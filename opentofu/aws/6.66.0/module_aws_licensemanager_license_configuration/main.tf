resource "aws_licensemanager_license_configuration" "licensemanager_license_configurations" {
  for_each = var.licensemanager_license_configurations

  license_counting_type    = each.value.license_counting_type
  name                     = each.value.name
  description              = each.value.description
  license_count            = each.value.license_count
  license_count_hard_limit = each.value.license_count_hard_limit
  license_rules            = each.value.license_rules
  region                   = each.value.region
  tags                     = each.value.tags
  tags_all                 = each.value.tags_all
}
