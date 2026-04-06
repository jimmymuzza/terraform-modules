resource "aws_datazone_environment_profile" "datazone_environment_profiles" {
  for_each = var.datazone_environment_profiles

  aws_account_region               = each.value.aws_account_region
  domain_identifier                = each.value.domain_identifier
  environment_blueprint_identifier = each.value.environment_blueprint_identifier
  name                             = each.value.name
  project_identifier               = each.value.project_identifier
  aws_account_id                   = each.value.aws_account_id
  description                      = each.value.description
  region                           = each.value.region

  dynamic "user_parameters" {
    for_each = each.value.user_parameters != null ? each.value.user_parameters : []
    content {
      name  = user_parameters.value.name
      value = user_parameters.value.value
    }
  }
}
