resource "azurerm_machine_learning_synapse_spark" "machine_learning_synapse_sparks" {
  for_each = var.machine_learning_synapse_sparks

  location                      = each.value.location
  machine_learning_workspace_id = each.value.machine_learning_workspace_id
  name                          = each.value.name
  synapse_spark_pool_id         = each.value.synapse_spark_pool_id
  description                   = each.value.description
  local_auth_enabled            = each.value.local_auth_enabled
  tags                          = each.value.tags

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }
}
