resource "aws_datazone_environment" "datazone_environments" {
  for_each = var.datazone_environments

  domain_identifier    = each.value.domain_identifier
  name                 = each.value.name
  profile_identifier   = each.value.profile_identifier
  project_identifier   = each.value.project_identifier
  account_identifier   = each.value.account_identifier
  account_region       = each.value.account_region
  blueprint_identifier = each.value.blueprint_identifier
  description          = each.value.description
  glossary_terms       = each.value.glossary_terms
  region               = each.value.region

  dynamic "user_parameters" {
    for_each = each.value.user_parameters != null ? each.value.user_parameters : []
    content {
      name  = user_parameters.value.name
      value = user_parameters.value.value
    }
  }
}
