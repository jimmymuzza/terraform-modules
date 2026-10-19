resource "azurerm_policy_virtual_machine_configuration_assignment" "policy_virtual_machine_configuration_assignments" {
  for_each = var.policy_virtual_machine_configuration_assignments

  location           = each.value.location
  name               = each.value.name
  virtual_machine_id = each.value.virtual_machine_id

  dynamic "configuration" {
    for_each = each.value.configuration != null ? each.value.configuration : []
    content {
      assignment_type = configuration.value.assignment_type
      content_hash    = configuration.value.content_hash
      content_uri     = configuration.value.content_uri
      version         = configuration.value.version

      dynamic "parameter" {
        for_each = configuration.value.parameter != null ? configuration.value.parameter : []
        content {
          name  = parameter.value.name
          value = parameter.value.value
        }
      }
    }
  }
}
