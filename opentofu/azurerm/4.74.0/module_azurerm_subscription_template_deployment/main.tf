resource "azurerm_subscription_template_deployment" "subscription_template_deployments" {
  for_each = var.subscription_template_deployments

  location                 = each.value.location
  name                     = each.value.name
  debug_level              = each.value.debug_level
  parameters_content       = each.value.parameters_content
  tags                     = each.value.tags
  template_content         = each.value.template_content
  template_spec_version_id = each.value.template_spec_version_id
}
