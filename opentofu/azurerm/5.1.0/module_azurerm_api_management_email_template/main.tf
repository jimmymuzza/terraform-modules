resource "azurerm_api_management_email_template" "api_management_email_templates" {
  for_each = var.api_management_email_templates

  api_management_name = each.value.api_management_name
  body                = each.value.body
  resource_group_name = each.value.resource_group_name
  subject             = each.value.subject
  template_name       = each.value.template_name
}
