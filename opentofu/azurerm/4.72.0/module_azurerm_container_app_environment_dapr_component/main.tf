resource "azurerm_container_app_environment_dapr_component" "container_app_environment_dapr_components" {
  for_each = var.container_app_environment_dapr_components

  component_type               = each.value.component_type
  container_app_environment_id = each.value.container_app_environment_id
  name                         = each.value.name
  version                      = each.value.version
  ignore_errors                = each.value.ignore_errors
  init_timeout                 = each.value.init_timeout
  scopes                       = each.value.scopes

  dynamic "metadata" {
    for_each = each.value.metadata != null ? each.value.metadata : []
    content {
      name        = metadata.value.name
      secret_name = metadata.value.secret_name
      value       = metadata.value.value
    }
  }

  dynamic "secret" {
    for_each = each.value.secret != null ? each.value.secret : []
    content {
      name                = secret.value.name
      identity            = secret.value.identity
      key_vault_secret_id = secret.value.key_vault_secret_id
      value               = secret.value.value
    }
  }
}
