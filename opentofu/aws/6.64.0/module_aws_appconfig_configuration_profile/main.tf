resource "aws_appconfig_configuration_profile" "appconfig_configuration_profiles" {
  for_each = var.appconfig_configuration_profiles

  application_id     = each.value.application_id
  location_uri       = each.value.location_uri
  name               = each.value.name
  description        = each.value.description
  kms_key_identifier = each.value.kms_key_identifier
  region             = each.value.region
  retrieval_role_arn = each.value.retrieval_role_arn
  tags               = each.value.tags
  tags_all           = each.value.tags_all
  type               = each.value.type

  dynamic "validator" {
    for_each = each.value.validator != null ? each.value.validator : []
    content {
      type    = validator.value.type
      content = validator.value.content
    }
  }
}
