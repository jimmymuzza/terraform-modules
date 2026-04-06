resource "azurerm_system_center_virtual_machine_manager_virtual_machine_instance_guest_agent" "system_center_virtual_machine_manager_virtual_machine_instance_guest_agents" {
  for_each = var.system_center_virtual_machine_manager_virtual_machine_instance_guest_agents

  password            = each.value.password
  scoped_resource_id  = each.value.scoped_resource_id
  username            = each.value.username
  provisioning_action = each.value.provisioning_action
}
