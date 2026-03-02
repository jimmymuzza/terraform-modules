resource "aws_datazone_environment_blueprint_configuration" "datazone_environment_blueprint_configurations" {
  for_each = var.datazone_environment_blueprint_configurations

  domain_id                = each.value.domain_id
  enabled_regions          = each.value.enabled_regions
  environment_blueprint_id = each.value.environment_blueprint_id
  manage_access_role_arn   = each.value.manage_access_role_arn
  provisioning_role_arn    = each.value.provisioning_role_arn
  region                   = each.value.region
  regional_parameters      = each.value.regional_parameters
}
