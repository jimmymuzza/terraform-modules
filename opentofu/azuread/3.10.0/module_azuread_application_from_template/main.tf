resource "azuread_application_from_template" "application_from_templates" {
  for_each = var.application_from_templates

  display_name = each.value.display_name
  template_id  = each.value.template_id
}
