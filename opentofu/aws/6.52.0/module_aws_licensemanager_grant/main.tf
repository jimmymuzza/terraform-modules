resource "aws_licensemanager_grant" "licensemanager_grants" {
  for_each = var.licensemanager_grants

  allowed_operations = each.value.allowed_operations
  license_arn        = each.value.license_arn
  name               = each.value.name
  principal          = each.value.principal
  region             = each.value.region
}
