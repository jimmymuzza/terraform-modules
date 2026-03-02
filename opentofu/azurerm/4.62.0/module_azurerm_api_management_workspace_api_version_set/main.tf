resource "azurerm_api_management_workspace_api_version_set" "api_management_workspace_api_version_sets" {
  for_each = var.api_management_workspace_api_version_sets

  api_management_workspace_id = each.value.api_management_workspace_id
  display_name                = each.value.display_name
  name                        = each.value.name
  versioning_scheme           = each.value.versioning_scheme
  description                 = each.value.description
  version_header_name         = each.value.version_header_name
  version_query_name          = each.value.version_query_name
}
