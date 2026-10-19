resource "azurerm_resource_deployment_script_azure_power_shell" "resource_deployment_script_azure_power_shells" {
  for_each = var.resource_deployment_script_azure_power_shells

  location               = each.value.location
  name                   = each.value.name
  resource_group_name    = each.value.resource_group_name
  retention_interval     = each.value.retention_interval
  version                = each.value.version
  cleanup_preference     = each.value.cleanup_preference
  command_line           = each.value.command_line
  force_update_tag       = each.value.force_update_tag
  primary_script_uri     = each.value.primary_script_uri
  script_content         = each.value.script_content
  supporting_script_uris = each.value.supporting_script_uris
  tags                   = each.value.tags
  timeout                = each.value.timeout

  dynamic "container" {
    for_each = each.value.container != null ? each.value.container : []
    content {
      container_group_name = container.value.container_group_name
    }
  }

  dynamic "environment_variable" {
    for_each = each.value.environment_variable != null ? each.value.environment_variable : []
    content {
      name         = environment_variable.value.name
      secure_value = environment_variable.value.secure_value
      value        = environment_variable.value.value
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      identity_ids = identity.value.identity_ids
      type         = identity.value.type
    }
  }

  dynamic "storage_account" {
    for_each = each.value.storage_account != null ? each.value.storage_account : []
    content {
      key  = storage_account.value.key
      name = storage_account.value.name
    }
  }
}
