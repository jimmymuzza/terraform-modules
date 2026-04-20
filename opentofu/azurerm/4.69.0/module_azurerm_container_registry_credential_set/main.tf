resource "azurerm_container_registry_credential_set" "container_registry_credential_sets" {
  for_each = var.container_registry_credential_sets

  container_registry_id = each.value.container_registry_id
  login_server          = each.value.login_server
  name                  = each.value.name

  dynamic "authentication_credentials" {
    for_each = each.value.authentication_credentials != null ? each.value.authentication_credentials : []
    content {
      password_secret_id = authentication_credentials.value.password_secret_id
      username_secret_id = authentication_credentials.value.username_secret_id
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type = identity.value.type
    }
  }
}
