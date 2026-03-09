resource "azurerm_machine_learning_workspace_network_outbound_rule_private_endpoint" "machine_learning_workspace_network_outbound_rule_private_endpoints" {
  for_each = var.machine_learning_workspace_network_outbound_rule_private_endpoints

  name                = each.value.name
  service_resource_id = each.value.service_resource_id
  sub_resource_target = each.value.sub_resource_target
  workspace_id        = each.value.workspace_id
  spark_enabled       = each.value.spark_enabled
}
