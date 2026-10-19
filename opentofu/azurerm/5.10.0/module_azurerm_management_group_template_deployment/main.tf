resource "azurerm_management_group_template_deployment" "management_group_template_deployments" {
  for_each = var.management_group_template_deployments

  location                 = each.value.location
  management_group_id      = each.value.management_group_id
  name                     = each.value.name
  debug_level              = each.value.debug_level
  parameters_content       = each.value.parameters_content
  tags                     = each.value.tags
  template_content         = each.value.template_content
  template_spec_version_id = each.value.template_spec_version_id
}
