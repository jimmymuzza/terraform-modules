resource "azurerm_static_web_app_function_app_registration" "static_web_app_function_app_registrations" {
  for_each = var.static_web_app_function_app_registrations

  function_app_id   = each.value.function_app_id
  static_web_app_id = each.value.static_web_app_id
}
