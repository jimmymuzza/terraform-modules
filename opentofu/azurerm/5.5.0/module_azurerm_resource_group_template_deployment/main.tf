resource "azurerm_resource_group_template_deployment" "resource_group_template_deployments" {
  for_each = var.resource_group_template_deployments

  deployment_mode          = each.value.deployment_mode
  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  debug_level              = each.value.debug_level
  parameters_content       = each.value.parameters_content
  tags                     = each.value.tags
  template_content         = each.value.template_content
  template_spec_version_id = each.value.template_spec_version_id
}
