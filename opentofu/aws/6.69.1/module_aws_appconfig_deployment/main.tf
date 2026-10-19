resource "aws_appconfig_deployment" "appconfig_deployments" {
  for_each = var.appconfig_deployments

  application_id           = each.value.application_id
  configuration_profile_id = each.value.configuration_profile_id
  configuration_version    = each.value.configuration_version
  deployment_strategy_id   = each.value.deployment_strategy_id
  environment_id           = each.value.environment_id
  description              = each.value.description
  kms_key_identifier       = each.value.kms_key_identifier
  region                   = each.value.region
  tags                     = each.value.tags
  tags_all                 = each.value.tags_all
}
