resource "aws_appconfig_extension_association" "appconfig_extension_associations" {
  for_each = var.appconfig_extension_associations

  extension_arn = each.value.extension_arn
  resource_arn  = each.value.resource_arn
  parameters    = each.value.parameters
  region        = each.value.region
}
