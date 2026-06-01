resource "aws_ssmquicksetup_configuration_manager" "ssmquicksetup_configuration_managers" {
  for_each = var.ssmquicksetup_configuration_managers

  name        = each.value.name
  description = each.value.description
  region      = each.value.region
  tags        = each.value.tags

  dynamic "configuration_definition" {
    for_each = each.value.configuration_definition != null ? each.value.configuration_definition : []
    content {
      parameters                               = configuration_definition.value.parameters
      type                                     = configuration_definition.value.type
      local_deployment_administration_role_arn = configuration_definition.value.local_deployment_administration_role_arn
      local_deployment_execution_role_name     = configuration_definition.value.local_deployment_execution_role_name
      type_version                             = configuration_definition.value.type_version
    }
  }
}
