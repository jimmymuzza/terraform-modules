resource "aws_appconfig_hosted_configuration_version" "appconfig_hosted_configuration_versions" {
  for_each = var.appconfig_hosted_configuration_versions

  application_id           = each.value.application_id
  configuration_profile_id = each.value.configuration_profile_id
  content                  = each.value.content
  content_type             = each.value.content_type
  description              = each.value.description
  region                   = each.value.region
}
