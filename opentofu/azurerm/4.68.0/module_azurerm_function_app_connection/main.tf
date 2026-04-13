resource "azurerm_function_app_connection" "function_app_connections" {
  for_each = var.function_app_connections

  function_app_id    = each.value.function_app_id
  name               = each.value.name
  target_resource_id = each.value.target_resource_id
  client_type        = each.value.client_type
  vnet_solution      = each.value.vnet_solution

  dynamic "authentication" {
    for_each = each.value.authentication != null ? each.value.authentication : []
    content {
      type            = authentication.value.type
      certificate     = authentication.value.certificate
      client_id       = authentication.value.client_id
      name            = authentication.value.name
      principal_id    = authentication.value.principal_id
      secret          = authentication.value.secret
      subscription_id = authentication.value.subscription_id
    }
  }

  dynamic "secret_store" {
    for_each = each.value.secret_store != null ? each.value.secret_store : []
    content {
      key_vault_id = secret_store.value.key_vault_id
    }
  }
}
