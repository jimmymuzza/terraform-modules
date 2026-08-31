resource "azurerm_api_management_api_tag_description" "api_management_api_tag_descriptions" {
  for_each = var.api_management_api_tag_descriptions

  api_tag_id                         = each.value.api_tag_id
  description                        = each.value.description
  external_documentation_description = each.value.external_documentation_description
  external_documentation_url         = each.value.external_documentation_url
}
