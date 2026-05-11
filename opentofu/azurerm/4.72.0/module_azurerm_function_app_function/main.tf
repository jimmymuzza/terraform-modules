resource "azurerm_function_app_function" "function_app_functions" {
  for_each = var.function_app_functions

  config_json     = each.value.config_json
  function_app_id = each.value.function_app_id
  name            = each.value.name
  enabled         = each.value.enabled
  language        = each.value.language
  test_data       = each.value.test_data

  dynamic "file" {
    for_each = each.value.file != null ? each.value.file : []
    content {
      content = file.value.content
      name    = file.value.name
    }
  }
}
