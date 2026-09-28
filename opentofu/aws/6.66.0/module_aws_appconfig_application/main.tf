resource "aws_appconfig_application" "appconfig_applications" {
  for_each = var.appconfig_applications

  name        = each.value.name
  description = each.value.description
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all
}
