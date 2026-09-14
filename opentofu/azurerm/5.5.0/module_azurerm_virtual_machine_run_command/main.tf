resource "azurerm_virtual_machine_run_command" "virtual_machine_run_commands" {
  for_each = var.virtual_machine_run_commands

  location           = each.value.location
  name               = each.value.name
  virtual_machine_id = each.value.virtual_machine_id
  error_blob_uri     = each.value.error_blob_uri
  output_blob_uri    = each.value.output_blob_uri
  run_as_password    = each.value.run_as_password
  run_as_user        = each.value.run_as_user
  tags               = each.value.tags

  dynamic "error_blob_managed_identity" {
    for_each = each.value.error_blob_managed_identity != null ? each.value.error_blob_managed_identity : []
    content {
      client_id = error_blob_managed_identity.value.client_id
      object_id = error_blob_managed_identity.value.object_id
    }
  }

  dynamic "output_blob_managed_identity" {
    for_each = each.value.output_blob_managed_identity != null ? each.value.output_blob_managed_identity : []
    content {
      client_id = output_blob_managed_identity.value.client_id
      object_id = output_blob_managed_identity.value.object_id
    }
  }

  dynamic "parameter" {
    for_each = each.value.parameter != null ? each.value.parameter : []
    content {
      name  = parameter.value.name
      value = parameter.value.value
    }
  }

  dynamic "protected_parameter" {
    for_each = each.value.protected_parameter != null ? each.value.protected_parameter : []
    content {
      name  = protected_parameter.value.name
      value = protected_parameter.value.value
    }
  }

  dynamic "source" {
    for_each = each.value.source != null ? each.value.source : []
    content {
      command_id = source.value.command_id
      script     = source.value.script
      script_uri = source.value.script_uri

      dynamic "script_uri_managed_identity" {
        for_each = source.value.script_uri_managed_identity != null ? source.value.script_uri_managed_identity : []
        content {
          client_id = script_uri_managed_identity.value.client_id
          object_id = script_uri_managed_identity.value.object_id
        }
      }
    }
  }
}
